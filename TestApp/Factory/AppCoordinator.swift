//
//  AppCoordinator.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

final class AppCoordinator: Coordinatable {
    private(set) var coordinators: [Coordinatable] = []
    
    private let factory: AppFactory
    
    init(factory: AppFactory) {
        self.factory = factory
    }

    func start() -> UIViewController {
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
    
        
        return tabBarController
        
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

