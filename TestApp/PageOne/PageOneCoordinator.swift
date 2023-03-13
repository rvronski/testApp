//
//  PageOneCoordinator.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

class PageOneCoordinator: ModuleCoordinatable {
    
    private(set) var coordinators: [Coordinatable] = []
    private(set) var module: Module?
    private let factory: AppFactory
    var moduleType: Module.ModuleType
    private var navigationController: UINavigationController
    
    init(moduleType: Module.ModuleType, factory: AppFactory, navigationController: UINavigationController) {
        self.moduleType = moduleType
        self.factory = factory
        self.navigationController = navigationController
    }
    
    func start() -> UIViewController {
        let module = factory.makeModule(ofType: .home)
        let viewController = module.view
        viewController.tabBarItem = moduleType.tabBarItem
        (module.viewModel as? PageOneViewModel)?.coordinator = self
        self.module = module
        return viewController
    }
    
    func popToLogin() {
        module?.view.navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    func removeCoordinator(coordinator: Coordinatable) {
        coordinators = coordinators.filter { $0 === coordinator }
        coordinators.removeAll()
    }
}
