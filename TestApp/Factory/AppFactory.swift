//
//  AppFactory.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

class AppFactory {
    
    
    private let coreDataManager: CoreDataManagerProtocol
    private let networkManager: NetworkProtocol
    
    init(coreDataManager: CoreDataManagerProtocol, networkManager: NetworkProtocol) {
        self.coreDataManager = coreDataManager
        self.networkManager = networkManager
    }
    
    func makeModule(ofType moduleType: Module.ModuleType) -> Module {
        switch moduleType {
        case.signIn:
            let viewModel = SigninViewModel(coreDataManager: coreDataManager)
            let view = UINavigationController(rootViewController: SigninViewController(viewModel: viewModel))
            return Module(moduleType: moduleType, viewModel: viewModel, view: view)
        case .login:
            let viewModel = SigninViewModel(coreDataManager: coreDataManager)
            let view = LoginViewController(viewModel: viewModel)
            return Module(moduleType: moduleType, viewModel: viewModel, view: view)
        case .home:
            let viewModel = PageOneViewModel(networkManager: networkManager)
            let view = UINavigationController(rootViewController: PageOneViewController(viewModel: viewModel))
            return Module(moduleType: moduleType, viewModel: viewModel, view: view)
        case .like:
            let viewModel = LikeViewModel()
            let view = UINavigationController(rootViewController: LikeViewController())
            return Module(moduleType: moduleType, viewModel: viewModel, view: view)
        case .cart:
            let viewModel = CartViewModel()
            let view = UINavigationController(rootViewController: CartViewController())
            return Module(moduleType: moduleType, viewModel: viewModel, view: view)
        case .chat:
            let viewModel = ChatViewModel()
            let view = UINavigationController(rootViewController: ChatViewController())
            return Module(moduleType: moduleType, viewModel: viewModel, view: view)
        case .profile:
            let viewModel = ProfileViewModel()
            let view = UINavigationController(rootViewController: ProfileViewController(viewModel: viewModel))
            return Module(moduleType: moduleType, viewModel: viewModel, view: view)
       
        }
    }
}
