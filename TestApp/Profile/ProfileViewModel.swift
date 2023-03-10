//
//  ProfileViewModel.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

protocol ProfileViewModelProcol: ViewModelProtocol {
//    func viewInputDidChange(viewInput: ProfileViewModel.ViewInput)
}

class ProfileViewModel: ProfileViewModelProcol {
    enum ViewInput {
        case pushPageTwo
    }
    var coordinator: ProfileCoordinator?
    
//    func viewInputDidChange(viewInput: ViewInput) {
//        switch viewInput {
//            
//        case .pushPageTwo:
//            <#code#>
//        }
//    }
}
