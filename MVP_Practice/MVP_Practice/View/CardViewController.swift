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

protocol CardPresenterInterface: AnyObject {
    func setupView(_ numberCardView: NumberCardViewInterface)
    func updateNmberCard()
}

//의존성 역전만 나눈상태에서 보호 입장에서 View가 Usecase 알고있으니 이걸 끊어놓음
final class CardViewController: UIViewController {
    
    private let numberView = CardView()
    private let presenter: CardPresenterInterface
    
    override func loadView() {
        view = numberView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setupView(self)
        setupEvent()
    }
    
    init(presenter: CardPresenterInterface) {
        self.presenter = presenter
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        numberView.content.text = "\(String(record.number)) : \(record.text)"
    }
}

   

