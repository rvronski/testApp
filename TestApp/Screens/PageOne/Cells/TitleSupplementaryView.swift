//
//  TitleSupplementaryView.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 20.03.2023.
//

import UIKit

class TitleSupplementaryView: UICollectionReusableView {
    let label = UILabel()
    static let reuseIdentifier = "title-supplementary-reuse-identifier"

    lazy var allButtom = CustomButton(buttonText: "View all", textColor: .gray, background: nil, fontSize: 12, fontWeight: .medium)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension TitleSupplementaryView {
    func configure() {
        addSubview(label)
        addSubview(allButtom)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
            
            allButtom.centerYAnchor.constraint(equalTo: self.label.centerYAnchor),
            allButtom.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset)
        ])
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
}
