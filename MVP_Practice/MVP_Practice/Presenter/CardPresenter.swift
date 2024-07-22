//
//  CardPresenter.swift
//  MVP_Prac
//
//  Created by Yeji Seo on 7/22/24.
//

import Foundation

final class CardPresenter {
    private weak var numberCardView: NumberCardViewInterface?
    private let networkService = NetworkService()
    
    func setupView(_ numberCardView: NumberCardViewInterface) {
        self.numberCardView = numberCardView
    }
}

extension CardPresenter {
    
    @MainActor
    func updateNmberCard() {
        Task {
            let result = try await networkService.getRecords()
            self.numberCardView?.displayCardRecordView(result)
        }
    }
    
}
