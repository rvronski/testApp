//
//  HomeViewModel.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

protocol PageOneViewModelProcol: ViewModelProtocol {
//    func viewInputDidChange(viewInput: PageOneViewModel.ViewInput)
    func returnToLogin()
}

class PageOneViewModel: PageOneViewModelProcol {
    enum ViewInput {
        case pushPageTwo
    }
    var coordinator: PageOneCoordinator!
    
    func returnToLogin() {
       
        coordinator.popToLogin()
    }
    
    
//    func viewInputDidChange(viewInput: ViewInput) {
//        switch viewInput {
//            
//        case .pushPageTwo:
//            <#code#>
//        }
//    }
}
