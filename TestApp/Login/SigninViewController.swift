//
//  LoginViewController.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

class SigninViewController: UIViewController {
    
    var viewModel: SigninViewModelProtocol
    
    init(viewModel: SigninViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var signView: SigninView = {
        let view = SigninView()
        view.delegate = self 
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = signView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {
        viewModel.onStateDidChange = { [weak self] state in
            guard let self = self else {
                return
            }
            switch state {
            case .initial:
               fallthrough
            case .succsess:
                self.viewModel.goToTabBar()
            case .fail:
                self.alertOk(title: "Что-то пошло не так", message: nil)
            }
        }
    }

}
extension SigninViewController: SigninViewDelegate {
    func signButtonDidTap(email: String, password: String, userName: String) {
        viewModel.signInButtonDidTap(email: email, password: password, userName: userName)
    }
    func showAlert() {
        self.alertOk(title: "Заполните все поля регистрации", message: nil)
    }
}