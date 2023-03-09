//
//  AppFactory.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

class AppFactory {
    
    
    func makeModule(ofType moduleType: Module.ModuleType) -> Module {
        switch moduleType {
            
        case .home:
            let viewModel = HomeViewModel()
        case .like:
            let viewModel = LikeViewModel()
        case .cart:
            let viewModel = CartViewModel()
        case .chat:
            let viewModel = ChatViewModel()
        case .profile:
            let viewModel = ProfileViewModel()
        }
    }
}
