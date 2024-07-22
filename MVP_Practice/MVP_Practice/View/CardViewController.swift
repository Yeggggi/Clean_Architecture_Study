//
//  CardViewController.swift
//  MVP_Prac
//
//  Created by Yeji Seo on 7/22/24.
//

import UIKit

protocol NumberCardViewInterface: AnyObject {
    func displayCardRecordView(_ model: NumberRecord)
}

class CardViewController: UIViewController {
    
    private let numberView = CardView()
    private let presenter = CardPresenter()
    
    override func loadView() {
        view = numberView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setupView(self)
        setupEvent()
    }
}

extension CardViewController {
    
    /// Target Event를 설정합니다.
    private func setupEvent() {
        numberView.button.addTarget(
            self,
            action: #selector(buttonTapped),
            for: .touchUpInside
        )
    }
    
    /// 버튼을 탭하면 데이터 update
    @objc private func buttonTapped() {
        presenter.updateNmberCard()
    }
}

extension CardViewController: NumberCardViewInterface {
  
    func displayCardRecordView(_ record: NumberRecord) {
//        numberView.numberRecord.text = String(record.number)
        numberView.content.text = "\(String(record.number)) : \(record.text)"
    }
}

   

