//
//  ProfileViewModel.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

protocol ProfileViewModelProcol: ViewModelProtocol {
    func returnToLogin()
    func uploadFoto(delegate: UIViewController)
}

class ProfileViewModel: ProfileViewModelProcol {
    
    var coordinator: ProfileCoordinator!
    
    func returnToLogin() {
        coordinator.popToLogin()
    }
    func uploadFoto(delegate: UIViewController) {
        coordinator.presentImagePicker(delegate: delegate)
    }
    
}
