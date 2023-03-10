//
//  LoginViewController.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModelProtocol
    
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var enterButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Enter", for: .normal)
        button.addTarget(self, action: #selector(goToTabBar), for: .touchUpInside)
        button.backgroundColor = .blue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(enterButton)
        NSLayoutConstraint.activate([
            self.enterButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.enterButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.enterButton.heightAnchor.constraint(equalToConstant: 50),
            self.enterButton.widthAnchor.constraint(equalToConstant: 200),
        ])
        
    }
    
    @objc private func goToTabBar() {
        viewModel.goToTabBar()
    }

    
}
