//
//  ProfileViewController.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    var viewModel: ProfileViewModelProcol
    
    init(viewModel: ProfileViewModelProcol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private lazy var outButton = CustomImageView(imageName: "avatarImage")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(outButton)
        
        NSLayoutConstraint.activate([
            self.outButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.outButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
    
        ])
//        outButton.tapButton = {[weak self] in
//            
//            self?.viewModel.returnToLogin()
//            
//        }
    }



}
