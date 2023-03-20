//
//  ShopCollectionViewCell.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 16.03.2023.
//

import UIKit

class LatestCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifire = "shopCell"
    
    private lazy var productImage = CustomImageView(imageName: "samsung")
    private lazy var priceLabel = InfoLabels(inform: "1800 $", size: 9, weight: .bold, color: .systemGray4)
    private lazy var nameLabel = InfoLabels(inform: "Samsung Galaxy", size: 10, weight: .bold, color: .white)
    private lazy var categorylabel = InfoLabels(inform: "Phones", size: 5, weight: .bold, color: .black)
    private lazy var categoryView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray.withAlphaComponent(0.5)
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        let image = UIImage.SymbolConfiguration(pointSize: 10, weight: .medium, scale: .large)
        button.setImage(UIImage(systemName: "plus", withConfiguration: image), for: .normal)
        button.imageView?.tintColor = .eyes
        button.backgroundColor = #colorLiteral(red: 0.8983454704, green: 0.9136870503, blue: 0.938336134, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addButton.layer.cornerRadius = 12.5
    }
    
    func configure(model: LatestItem) {
        self.productImage.image = model.imageUrl
        self.priceLabel.text = "$ \(model.price)"
        self.nameLabel.text = model.name
        self.categorylabel.text = model.category
        
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .backgroundColor
        self.contentView.addSubview(self.productImage)
        self.productImage.addSubview(self.priceLabel)
        self.productImage.addSubview(self.nameLabel)
        self.productImage.addSubview(self.categoryView)
        self.categoryView.addSubview(self.categorylabel)
        self.productImage.addSubview(self.addButton)
        self.productImage.layer.cornerRadius = 10
        self.productImage.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
        
            self.productImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.productImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.productImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.productImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        
            self.categoryView.bottomAnchor.constraint(equalTo: self.productImage.bottomAnchor, constant: -46),
            self.categoryView.leftAnchor.constraint(equalTo: self.productImage.leftAnchor, constant: 7),
            self.categoryView.widthAnchor.constraint(equalTo: self.productImage.widthAnchor, multiplier: 0.307),
            self.categoryView.heightAnchor.constraint(equalTo: self.categoryView.widthAnchor, multiplier: 0.342),
            
            self.categorylabel.centerXAnchor.constraint(equalTo: self.categoryView.centerXAnchor),
            self.categorylabel.centerYAnchor.constraint(equalTo: self.categoryView.centerYAnchor),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.categoryView.bottomAnchor,constant: 6),
            self.nameLabel.leftAnchor.constraint(equalTo: self.productImage.leftAnchor, constant: 7),
            
            self.priceLabel.bottomAnchor.constraint(equalTo: self.productImage.bottomAnchor,constant: -7),
            self.priceLabel.leftAnchor.constraint(equalTo: self.productImage.leftAnchor, constant: 7),
            
            self.addButton.rightAnchor.constraint(equalTo: self.productImage.rightAnchor, constant: -5),
            self.addButton.bottomAnchor.constraint(equalTo: self.productImage.bottomAnchor, constant: -5),
            self.addButton.heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.175),
            self.addButton.widthAnchor.constraint(equalTo: self.addButton.heightAnchor),
        ])
        
       
    }
    
}
