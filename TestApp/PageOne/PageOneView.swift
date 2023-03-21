//
//  PageOneView.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 15.03.2023.
//

import UIKit

class PageOneView: UIView {
    
    let searchBar = CustomSearchBar()
    lazy var avatarView = CustomImageView(imageName: "avatarImage")
    private lazy var navigationLabel = InfoLabels(inform: "Trade by", size: 20, weight: .bold, color: .black)
    private lazy var navigationLabel2 = InfoLabels(inform: "bata", size: 20, weight: .bold, color: .buttonColor)
    private lazy var locationabel = InfoLabels(inform: "Location", size: 10, weight: .medium, color: .gray)
    private lazy var arrowImage = CustomSystemImageView(systemName: "chevron.down", color: .black)
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        self.backgroundColor = .backgroundColor
        self.addSubview(activityIndicator)
        self.addSubview(searchBar)
        self.addSubview(avatarView)
        self.addSubview(navigationLabel)
        self.addSubview(navigationLabel2)
        self.addSubview(locationabel)
        self.addSubview(arrowImage)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            avatarView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            avatarView.rightAnchor.constraint(equalTo: self.rightAnchor, constant:  -50),
            avatarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
            avatarView.heightAnchor.constraint(equalTo: avatarView.widthAnchor),
            
            self.navigationLabel2.centerYAnchor.constraint(equalTo: self.avatarView.centerYAnchor),
            self.navigationLabel2.rightAnchor.constraint(equalTo: self.avatarView.leftAnchor, constant: -55),
            self.navigationLabel.centerYAnchor.constraint(equalTo: self.avatarView.centerYAnchor),
            self.navigationLabel.rightAnchor.constraint(equalTo: self.navigationLabel2.leftAnchor, constant: -6),
            
            self.locationabel.topAnchor.constraint(equalTo: self.avatarView.bottomAnchor, constant: 10),
            self.locationabel.centerXAnchor.constraint(equalTo: self.avatarView.centerXAnchor, constant: -5),
            
            self.arrowImage.leftAnchor.constraint(equalTo: self.locationabel.rightAnchor, constant: 4),
            self.arrowImage.centerYAnchor.constraint(equalTo: self.locationabel.centerYAnchor),
            self.arrowImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.02),
            self.arrowImage.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.01),
            
            searchBar.topAnchor.constraint(equalTo: locationabel.bottomAnchor, constant: 10),
            searchBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            searchBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 30),

        ])
    }
}
