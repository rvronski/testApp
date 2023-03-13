//
//  ProfileView.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 13.03.2023.
//

import UIKit

class ProfileView: UIView {
    
    lazy var avatarImage = CustomImageView(imageName: "avatarImage")
    
    private lazy var changeFotoButton = CustomButton(buttonText: "Change photo", textColor: .gray, background: nil, fontSize: 12, fontWeight: .medium)
    
    private lazy var nameLabel = InfoLabels(inform: "Satria Adhi Pradana", size: 20, weight: .bold, color: .black)
    
    private lazy var uploadButton = CustomButton(buttonText: "Upload item", textColor: .white, background: .buttonColor, fontSize: 20, fontWeight: .bold)
    
    private lazy var uploadImage = CustomImageView(imageName: "uploadImage")
    
    private lazy var cardImage = CustomImageView(imageName: "cardImage")
    private lazy var cardImage1 = CustomImageView(imageName: "cardImage")
    private lazy var cardImage2 = CustomImageView(imageName: "cardImage")
    private lazy var cardImage3 = CustomImageView(imageName: "cardImage")
    private lazy var spinImage = CustomImageView(imageName: "spinImage")
    private lazy var helpImage = CustomImageView(imageName: "helpImage")
    private lazy var logoutImage = CustomImageView(imageName: "logoutImage")
    
    private lazy var tradeStoreButton = CustomButton(buttonText: "Trade store", textColor: .black, background: nil, fontSize: 20, fontWeight: .bold)
    private lazy var paymentButton = CustomButton(buttonText: "Payment method", textColor: .black, background: nil, fontSize: 20, fontWeight: .bold)
    private lazy var balanceButton = CustomButton(buttonText: "Balance", textColor: .black, background: nil, fontSize: 20, fontWeight: .bold)
    private lazy var tradeButton = CustomButton(buttonText: "Trade history", textColor: .black, background: nil, fontSize: 20, fontWeight: .bold)
    private lazy var restoreButton = CustomButton(buttonText: "Restore purchase", textColor: .black, background: nil, fontSize: 20, fontWeight: .bold)
    private lazy var helpButton = CustomButton(buttonText: "Help", textColor: .black, background: nil, fontSize: 20, fontWeight: .bold)
    private lazy var logoutButton = CustomButton(buttonText: "Log out", textColor: .black, background: nil, fontSize: 20, fontWeight: .bold)
    
    private lazy var imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(self.cardImage)
        stackView.addArrangedSubview(self.cardImage1)
        stackView.addArrangedSubview(self.cardImage2)
        stackView.addArrangedSubview(self.cardImage3)
        stackView.addArrangedSubview(self.spinImage)
        stackView.addArrangedSubview(self.helpImage)
        stackView.addArrangedSubview(self.logoutImage)
        return stackView
    }()
   
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 50
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(self.tradeStoreButton)
        stackView.addArrangedSubview(self.paymentButton)
        stackView.addArrangedSubview(self.balanceButton)
        stackView.addArrangedSubview(self.tradeButton)
        stackView.addArrangedSubview(self.restoreButton)
        stackView.addArrangedSubview(self.helpButton)
        stackView.addArrangedSubview(self.logoutButton)
        return stackView
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
        self.avatarImage.layer.cornerRadius = self.avatarImage.frame.height/2
    }
    
    private func setupView() {
        self.backgroundColor = .backgroundColor
        self.addSubview(avatarImage)
        self.addSubview(changeFotoButton)
        self.addSubview(nameLabel)
        self.addSubview(uploadButton)
        self.addSubview(uploadImage)
        self.addSubview(imageStackView)
        self.addSubview(buttonStackView)
       
        
        NSLayoutConstraint.activate([
            self.avatarImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.avatarImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 37),
            self.avatarImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.16),
            self.avatarImage.heightAnchor.constraint(equalTo: self.avatarImage.widthAnchor),
    
            self.changeFotoButton.topAnchor.constraint(equalTo: self.avatarImage.bottomAnchor, constant: 8),
            self.changeFotoButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.changeFotoButton.bottomAnchor,constant: 20),
            self.nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.uploadButton.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 37),
            self.uploadButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.uploadButton.heightAnchor.constraint(equalTo: self.uploadButton.widthAnchor, multiplier: 0.159),
            self.uploadButton.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 0.786),
            
            self.uploadImage.centerYAnchor.constraint(equalTo: self.uploadButton.centerYAnchor),
            self.uploadImage.leftAnchor.constraint(equalTo: self.uploadButton.leftAnchor, constant: 50),
            self.uploadImage.widthAnchor.constraint(equalTo: self.uploadButton.widthAnchor,multiplier: 0.08),
            self.uploadImage.heightAnchor.constraint(equalTo: self.uploadImage.widthAnchor),
            
            self.imageStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 28),
            self.imageStackView.topAnchor.constraint(equalTo: self.uploadButton.bottomAnchor, constant: 14),
            self.cardImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
            self.cardImage.heightAnchor.constraint(equalTo: self.cardImage.widthAnchor),
            
            
            self.buttonStackView.leftAnchor.constraint(equalTo: self.imageStackView.rightAnchor, constant: 7),
            self.buttonStackView.topAnchor.constraint(equalTo: self.uploadButton.bottomAnchor, constant: 24),
            
            
        ])
        
    }
    
    
}
