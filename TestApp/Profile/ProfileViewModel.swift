//
//  ProfileViewModel.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

protocol ProfileViewModelProcol: ViewModelProtocol {
    func returnToLogin()
}

class ProfileViewModel: ProfileViewModelProcol {
    enum ViewInput {
        case pushPageTwo
    }
    var coordinator: ProfileCoordinator!
    
  func returnToLogin() {
    coordinator.popToLogin()
}
}
