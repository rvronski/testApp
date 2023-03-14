//
//  ProfileView.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 13.03.2023.
//

import UIKit

protocol ProfileViewDelegate: AnyObject {
    func uploadButtonDidTap()
}

class ProfileView: UIView {
    
    var delegate: ProfileViewDelegate?
    
    lazy var avatarImage = CustomImageView(imageName: "avatarImage")
    
    private lazy var changeFotoButton = CustomButton(buttonText: "Change photo", textColor: .gray, background: nil, fontSize: 12, fontWeight: .medium)
    
    private lazy var nameLabel = InfoLabels(inform: "Satria Adhi Pradana", size: 20, weight: .bold, color: .black)
    
    private lazy var uploadButton = CustomButton(buttonText: "Upload item", textColor: .white, background: .buttonColor, fontSize: 20, fontWeight: .bold)
    
    private lazy var uploadImage = CustomImageView(imageName: "uploadImage")
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.backgroundColor = .backgroundColor
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        return tableView
    }()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        uploadButton.tapButton = { [weak self] in
            self?.delegate?.uploadButtonDidTap()
        }
        changeFotoButton.tapButton = { [weak self] in
            self?.delegate?.uploadButtonDidTap()
        }
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
        self.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            self.avatarImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.avatarImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
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
            
            self.tableView.topAnchor.constraint(equalTo: self.uploadButton.bottomAnchor, constant: 2),
            self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
        ])
        
    }
    
    func configureTableView(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileCell")
    }
    
}
