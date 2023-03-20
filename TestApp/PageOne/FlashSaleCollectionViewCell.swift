//
//  FlashSaleCollectionViewCell.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 18.03.2023.
//

import UIKit

class FlashSaleCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifire = "flashSaleCell"
    
    private lazy var productImage = CustomImageView(imageName: "samsung")
    private lazy var priceLabel = InfoLabels(inform: "1800 $", size: 10, weight: .bold, color: .systemGray4)
    private lazy var nameLabel = InfoLabels(inform: "Samsung Galaxy", size: 16, weight: .bold, color: .white)
    private lazy var categorylabel = InfoLabels(inform: "Phones", size: 10, weight: .bold, color: .black)
    private lazy var discountLabel = InfoLabels(inform: "30%", size: 13, weight: .bold, color: .white)
    
    private lazy var categoryView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray.withAlphaComponent(0.5)
        view.layer.cornerRadius = 9
        return view
    }()
    
    private lazy var discountView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 9
        return view
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        let image = UIImage.SymbolConfiguration(pointSize: 10, weight: .medium, scale: .large)
        button.setImage(UIImage(systemName: "plus", withConfiguration: image), for: .normal)
        button.imageView?.tintColor = .eyes
        button.backgroundColor = #colorLiteral(red: 0.8983454704, green: 0.9136870503, blue: 0.938336134, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.cornerRadius =  self.addButton.frame.width/2
        return button
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        let image = UIImage.SymbolConfiguration(pointSize: 13, weight: .medium, scale: .large)
        button.setImage(UIImage(systemName: "heart", withConfiguration: image), for: .normal)
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
        self.addButton.layer.cornerRadius = 17.5
        self.likeButton.layer.cornerRadius = 14
    }
    
    func configure(model: FlashSaleItem) {
        self.productImage.image = model.imageUrl
        self.priceLabel.text = "$ \(model.price)"
        self.nameLabel.text = model.name
        self.categorylabel.text = model.category
        self.discountLabel.text = "\(model.discount ?? 0)% off"
        
        
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .backgroundColor
        self.contentView.addSubview(self.productImage)
        self.productImage.addSubview(self.priceLabel)
        self.productImage.addSubview(self.nameLabel)
        self.productImage.addSubview(self.categoryView)
        self.categoryView.addSubview(self.categorylabel)
        self.productImage.addSubview(self.addButton)
        self.productImage.addSubview(self.likeButton)
        self.productImage.addSubview(self.discountView)
        self.discountView.addSubview(self.discountLabel)
        self.productImage.layer.cornerRadius = 10
        self.productImage.contentMode = .scaleAspectFill
        self.nameLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
        
            self.productImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.productImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.productImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.productImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        
            self.categoryView.bottomAnchor.constraint(equalTo: self.productImage.bottomAnchor, constant: -83),
            self.categoryView.leftAnchor.constraint(equalTo: self.productImage.leftAnchor, constant: 10),
            self.categoryView.widthAnchor.constraint(equalTo: self.productImage.widthAnchor, multiplier: 0.307),
            self.categoryView.heightAnchor.constraint(equalTo: self.categoryView.widthAnchor, multiplier: 0.342),
            
            self.categorylabel.centerXAnchor.constraint(equalTo: self.categoryView.centerXAnchor),
            self.categorylabel.centerYAnchor.constraint(equalTo: self.categoryView.centerYAnchor),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.categoryView.bottomAnchor,constant: 11),
            self.nameLabel.leftAnchor.constraint(equalTo: self.productImage.leftAnchor, constant: 10),
            self.nameLabel.rightAnchor.constraint(equalTo: self.likeButton.leftAnchor),
            
            self.priceLabel.bottomAnchor.constraint(equalTo: self.productImage.bottomAnchor,constant: -10),
            self.priceLabel.leftAnchor.constraint(equalTo: self.productImage.leftAnchor, constant: 10),
            
            self.addButton.rightAnchor.constraint(equalTo: self.productImage.rightAnchor, constant: -5),
            self.addButton.bottomAnchor.constraint(equalTo: self.productImage.bottomAnchor, constant: -7),
            self.addButton.heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.175),
            self.addButton.widthAnchor.constraint(equalTo: self.addButton.heightAnchor),
            
            self.likeButton.rightAnchor.constraint(equalTo: self.addButton.leftAnchor, constant: -4),
            self.likeButton.centerYAnchor.constraint(equalTo: self.addButton.centerYAnchor),
            self.likeButton.heightAnchor.constraint(equalTo: self.productImage.widthAnchor, multiplier: 0.140),
            self.likeButton.widthAnchor.constraint(equalTo: self.likeButton.heightAnchor),
            
            self.discountView.topAnchor.constraint(equalTo: self.productImage.topAnchor, constant: 7),
            self.discountView.rightAnchor.constraint(equalTo: self.productImage.rightAnchor, constant: -10),
            self.discountView.widthAnchor.constraint(equalTo: self.productImage.widthAnchor, multiplier: 0.307),
            self.discountView.heightAnchor.constraint(equalTo: self.discountView.widthAnchor, multiplier: 0.342),
            
            self.discountLabel.centerXAnchor.constraint(equalTo: self.discountView.centerXAnchor),
            self.discountLabel.centerYAnchor.constraint(equalTo: self.discountView.centerYAnchor),
            
        ])
        
    }
}
