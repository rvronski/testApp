//
//  ChatCoordinator.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

class ChatCoordinator: ModuleCoordinatable {
    var module: Module?
    private let factory: AppFactory
   private(set) var moduleType: Module.ModuleType
    
   private(set) var coordinators: [Coordinatable] = []
    init(factory:AppFactory, moduleType: Module.ModuleType){
        self.factory = factory
        self.moduleType = moduleType
    }
    
    func start() -> UIViewController {
        let module = factory.makeModule(ofType: .chat)
        let viewController = module.view
        viewController.tabBarItem = moduleType.tabBarItem
        return viewController
    }
}
