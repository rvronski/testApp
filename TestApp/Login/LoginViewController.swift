//
//  CreatePasswordViewController.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 12.03.2023.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func goToTabBar()
}

class LoginViewController: UIViewController {
    
    var delegate: LoginViewDelegate?
    
    var viewModel: SigninViewModelProtocol
    
    init(viewModel: SigninViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    private lazy var welcomeLabel = InfoLabels(inform: "Welcome back", size: 30, weight: .bold, color: .black)
    
    private lazy var firstNameTextField = regTextField(placeholderText: "First name", typeKeyBoard: .default)
    
    private lazy var passwordTextField = regTextField(placeholderText: "Password", typeKeyBoard: .default)
    
    private lazy var regButton = CustomButton(buttonText: "Login", textColor: .white, background: .buttonColor, fontSize: 20, fontWeight: .bold)

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 35
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(self.firstNameTextField)
        stackView.addArrangedSubview(self.passwordTextField)
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
        regButton.tapButton = { [weak self] in
            self?.delegate?.goToTabBar()
        }
    }
    private func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    private func setupView() {
        self.view.backgroundColor = .backgroundColor
        self.view.addSubview(welcomeLabel)
        self.view.addSubview(stackView)
        self.view.addSubview(regButton)
        
        NSLayoutConstraint.activate([
        
            self.welcomeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.welcomeLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 96),
            
            self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.welcomeLabel.bottomAnchor,constant: 80),
            self.stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor,multiplier: 0.786),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.1),
        
            self.regButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 99),
            self.regButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.regButton.widthAnchor.constraint(equalTo: self.stackView.widthAnchor),
            self.regButton.heightAnchor.constraint(equalTo: self.regButton.widthAnchor, multiplier: 0.159),
        
        ])
        
    }

   
}
