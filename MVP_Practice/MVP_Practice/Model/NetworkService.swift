//
//  NetworkModel.swift
//  ArcitectureStudy
//
//  Created by Yeji Seo on 7/15/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed(statusCode: Int)
    case dataLoadingError(underlyingError: Error)
    case decodingError(underlyingError: Error)
}

enum DataError: Error {
    case invalidData
    case invalidResponse
    case message(_ error: Error?)
}


// struct와 class의 사용 이해
struct NetworkService{
    private let urlString = "http://numbersapi.com/42?json"
    
    // 외부에서 데이터 읽어들일 때 사용
    func getRecords() async throws -> NumberRecord {
        let numberRecord: NumberRecord = try await fetchData()
        return numberRecord
    }
    
    //URLSession, Decode
    //제네릭을 쓸 때 파라미터로 들어오는 걸로 보통은 추론함, but 이번의 경우엔 return 타입이 NumberRecord이고, Codable 하기 때문에 NumberRecord를 타입으로 추론하고 채택한 경우임
    private func fetchData<T: Decodable>() async throws -> T {
        guard let url = URL(string: urlString) else {
            print("APIError.invalidURL")
            throw APIError.invalidURL
        }
        
        do {
            //urlSession으로 데이터 요청
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("HTTPURLResponse)?.statusCode ?? -1")
                throw APIError.requestFailed(statusCode: (response as? HTTPURLResponse)?.statusCode ?? -1)
            }
            //decode
            return try JSONDecoder().decode(T.self, from: data)
            
        } catch {
            // Check for invalid JSON (optional)
            if let decodingError = error as? DecodingError {
                print("APIError.decodingError(underlyingError: decodingError)")
                throw APIError.decodingError(underlyingError: decodingError)
            } else {
                print("APIError.dataLoadingError(underlyingError: error)")
                throw APIError.dataLoadingError(underlyingError: error)
            }
        }
    }
}
