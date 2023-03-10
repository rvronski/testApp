//
//  AppCoordinator.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

final class AppCoordinator: Coordinatable {
    
    private(set) var coordinators: [Coordinatable] = []
    private(set) var module: Module?
    private let factory: AppFactory
    var navigationController: UINavigationController
    init(factory: AppFactory, navigationController: UINavigationController ) {
        self.factory = factory
        self.navigationController = navigationController
    }

    
    func start() -> UIViewController {
        
        let module = factory.makeModule(ofType: .login)
        let viewController = module.view
        (module.viewModel as! LoginViewModel).coordinator = self
        self.module = module
        return viewController
    }
    
    func goToTabBar() {
       
        let pageOneCoordinator = PageOneCoordinator(moduleType: .home, factory: factory, navigationController: UINavigationController())
        let likeCoordinator = LikeCoordinator(factory: factory, moduleType: .like)
        let cartCoordinator = CartCoordinator(factory: factory, moduleType: .cart)
        let chatCoordinator = ChatCoordinator(factory: factory, moduleType: .chat)
        let profileCoordinator = ProfileCoordinator(moduleType: .profile, factory: factory, navigationController: UINavigationController())
        let tabBarController = AppTabBarController(viewControllers:
                                                    [pageOneCoordinator.start(),
                                                     likeCoordinator.start(),
                                                     cartCoordinator.start(),
                                                     chatCoordinator.start(),
                                                     profileCoordinator.start()])
        addCoordinator(coordinator: pageOneCoordinator)
        addCoordinator(coordinator: likeCoordinator)
        addCoordinator(coordinator: cartCoordinator)
        addCoordinator(coordinator: chatCoordinator)
        addCoordinator(coordinator: profileCoordinator)
        
        (module!.view as? UINavigationController)?.pushViewController(tabBarController, animated: true)
    }
    
    func addCoordinator(coordinator: Coordinatable) {
        guard coordinators.contains(where: { $0 === coordinator }) else {
            return
        }
        coordinators.append(coordinator)
    }

    func removeCoordinator(coordinator: Coordinatable) {
        coordinators = coordinators.filter { $0 === coordinator }
    }
    
}

