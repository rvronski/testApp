//
//  LoginViewModel.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

protocol LoginViewModelProtocol: ViewModelProtocol {
    func goToTabBar()
}

class LoginViewModel: LoginViewModelProtocol {
        weak var coordinator: AppCoordinator!
        
        func goToTabBar(){
            coordinator.goToTabBar()
        }
    }
    

