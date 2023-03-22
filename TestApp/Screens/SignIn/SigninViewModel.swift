//
//  LoginViewModel.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

protocol SigninViewModelProtocol: ViewModelProtocol {
    var onStateDidChange: ((SigninViewModel.State) -> Void)? { get set }
    func goToTabBar()
    func goToLogin()
    func signInButtonDidTap(email: String, firstName: String, lastName: String)
    func loginButtonDidTap(firstName: String, password: String)
}

class SigninViewModel: SigninViewModelProtocol {

    enum State {
        case initial
        case succsess
        case userNotFound
        case wrongPassword
        case fail
    }
    
    var onStateDidChange: ((State) -> Void)?
    
    private(set) var state: State = .initial {
        didSet {
            onStateDidChange?(state)
        }
    }
    
     var coordinator: AppCoordinator!
    
    private let coreDataManager: CoreDataManagerProtocol

    init(coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }
    
    func signInButtonDidTap(email: String, firstName: String, lastName: String) {
        coreDataManager.createUser(email: email, firstName: firstName, lastName: lastName) { [weak self] result in
            switch result {
            case true:
                DispatchQueue.main.async {
                    self?.goToTabBar()
                }
            case false:
                DispatchQueue.main.async {
                    self?.state = .fail
                }
            }
        }
    }
    
    func loginButtonDidTap(firstName: String, password: String) {
        coreDataManager.getUser(firstName: firstName) { [weak self] user in
            guard let user else { self?.state = .userNotFound
                return
            }
            if user.email == password {
                DispatchQueue.main.async {
                    self?.goToTabBar()
                }
            } else {
                self?.state = .wrongPassword
            }
        }
    }
    
    
    func goToTabBar(){
        coordinator.goTo(viewModel: self, pushTo: .tabBar)
    }
    
    func goToLogin() {
        coordinator.goTo(viewModel: self, pushTo: .loginVC(self))
    }
    
}

