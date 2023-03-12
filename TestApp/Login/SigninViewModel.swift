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
    func signInButtonDidTap(email: String, password: String, userName: String)
}

class SigninViewModel: SigninViewModelProtocol {
    
    enum State {
        case initial
        case succsess
        case fail
    }
    
    var onStateDidChange: ((State) -> Void)?

    private(set) var state: State = .initial {
        didSet {
            onStateDidChange?(state)
        }
    }
    
    weak var coordinator: AppCoordinator!
    
    private let networkService: CheckerServiceProtocol

    init(networkService: CheckerServiceProtocol) {
        self.networkService = networkService
    }
        
    func signInButtonDidTap(email: String, password: String, userName: String) {
        networkService.signUp(email: email, password: password, userName: userName) { [weak self] result in
            if result {
                self?.state = .succsess
            } else {
                self?.state = .fail
            }
        }
    }
        func goToTabBar(){
            coordinator.goToTabBar()
        }
    }
    

