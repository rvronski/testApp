//
//  MenuCollectionViewCell.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 15.03.2023.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    private lazy var menuImage = CustomImageView(imageName: "menuRobot")
    
    private lazy var menuLabel = InfoLabels(inform: "Menu", size: 12, weight: .medium, color: .gray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
    }
    
    
    private func setupView() {
        self.contentView.backgroundColor = .backgroundColor
        self.contentView.addSubview(self.menuImage)
        self.contentView.addSubview(self.menuLabel)
        
        NSLayoutConstraint.activate([
        
            self.menuImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.menuImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.menuImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.menuImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.menuImage.heightAnchor.constraint(equalTo: self.menuImage.widthAnchor),
            
            self.menuLabel.topAnchor.constraint(equalTo: self.menuImage.bottomAnchor, constant: 14),
            self.menuLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            
            
        
        
        ])
        
    }
}
