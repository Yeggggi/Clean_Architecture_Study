//
//  CardView.swift
//  MVP_Prac
//
//  Created by Yeji Seo on 7/22/24.
//

import UIKit

final class CardView: UIView {
    

    
    let title: UILabel = {
        let label = UILabel()
        label.text = "버튼을 클릭하면 42에 대한 내용이 업데이트됩니다"
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Button", for: .normal)
        return button
    }()
    
    let numberRecord: UILabel = {
        let label = UILabel()
        label.text = "0"
        return label
    }()
    
//
    let content: UILabel = {
        let label = UILabel()
        label.text = "content"
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardView {
    
    private func setupUI() {
        backgroundColor = .white
    }
    
    private func setupAutoLayout() {
        [numberRecord, title, button, content]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        NSLayoutConstraint.activate([
//            numberRecord.centerXAnchor.constraint(equalTo: centerXAnchor),
//            numberRecord.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -32),
            
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 8),
            
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),

            content.centerXAnchor.constraint(equalTo: centerXAnchor),
            content.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 24),
            content.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 56),
            content.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -56),
        ])
    }
}

