//
//  PageOneTableViewCell.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 16.03.2023.
//

import UIKit

class BrandCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "BrandsCell"
    
    private lazy var brandsImage = CustomImageView(imageName: "")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: String) {
        self.brandsImage.image = UIImage(named: model)
    }
    
    private func setupView() {
        contentView.backgroundColor = .backgroundColor
        self.contentView.addSubview(brandsImage)
        brandsImage.layer.cornerRadius = 10
        brandsImage.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            
            self.brandsImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.brandsImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.brandsImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.brandsImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
        ])
    }
    
}
