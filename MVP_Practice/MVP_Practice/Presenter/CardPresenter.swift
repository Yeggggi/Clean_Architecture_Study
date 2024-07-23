//
//  CardPresenter.swift
//  MVP_Prac
//
//  Created by Yeji Seo on 7/22/24.
//

import Foundation

final class CardPresenter: CardPresenterInterface {
    private weak var numberCardView: NumberCardViewInterface?
    private let networkService = NetworkService()
    
    func setupView(_ numberCardView: NumberCardViewInterface) {
        self.numberCardView = numberCardView
    }
}

extension CardPresenter {
    @MainActor //  Main View 를 건들이는 함수이기 떄문에 MainActor 사용
    func updateNmberCard() {
        Task {
            let result = try await networkService.getRecords()
            self.numberCardView?.displayCardRecordView(result)
        }
    }

}
