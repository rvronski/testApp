//
//  ProfileTableViewCell.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 14.03.2023.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    private lazy var cardImage = CustomImageView(imageName: "")
    
    private lazy var arrowImage = CustomImageView(imageName: "arrow")
   
    private lazy var settingsLabel = InfoLabels(inform: "", size: 20, weight: .regular, color: .black)
    private lazy var sumLabel = InfoLabels(inform: "$ 1593", size: 15, weight: .medium, color: .black)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(modelImage: String, modelString: String) {
        self.cardImage.image = UIImage(named: modelImage)
        self.settingsLabel.text = modelString
    }
    
    func hideArrow(isArrowHidden: Bool, isSumHidden: Bool) {
        self.arrowImage.isHidden = isArrowHidden
        self.sumLabel.isHidden = isSumHidden
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .backgroundColor
        self.contentView.addSubview(cardImage)
        self.contentView.addSubview(arrowImage)
        self.contentView.addSubview(settingsLabel)
        self.contentView.addSubview(sumLabel)
        self.sumLabel.isHidden = true
        
        NSLayoutConstraint.activate([
        
            self.cardImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            self.cardImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            self.cardImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 32),
            self.cardImage.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.1),
            self.cardImage.heightAnchor.constraint(equalTo: self.cardImage.widthAnchor),
            
            self.settingsLabel.centerYAnchor.constraint(equalTo: self.cardImage.centerYAnchor),
            self.settingsLabel.leftAnchor.constraint(equalTo: self.cardImage.rightAnchor, constant: 9),
            
            self.arrowImage.centerYAnchor.constraint(equalTo: self.cardImage.centerYAnchor),
            self.arrowImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -45),
            
            self.sumLabel.centerYAnchor.constraint(equalTo: self.cardImage.centerYAnchor),
            self.sumLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -45)
            
        ])
    }
}
