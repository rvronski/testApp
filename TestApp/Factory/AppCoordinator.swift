//
//  AppCoordinator.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

final class AppCoordinator: Coordinatable {
    enum PushVC {
        case loginVC(ViewModelProtocol)
        case tabBar
    }
    private let coreDataManager: CoreDataManagerProtocol
    private(set) var coordinators: [Coordinatable] = []
    private(set) var module: Module?
    private let factory: AppFactory
    var navigationController: UINavigationController
    init(factory: AppFactory, navigationController: UINavigationController, coreDataManager: CoreDataManagerProtocol) {
        self.factory = factory
        self.navigationController = navigationController
        self.coreDataManager = coreDataManager
    }

    
    func start() -> UIViewController {
        let module = factory.makeModule(ofType: .signIn)
        let viewController = module.view
        (module.viewModel as! SigninViewModel).coordinator = self
        self.module = module
        return viewController
    }
    
    func goTo(viewModel: ViewModelProtocol, pushTo: PushVC) {
        switch pushTo {
            
        case let .loginVC(viewModel):
            let viewControllerToPush = LoginViewController(viewModel: viewModel as! SigninViewModelProtocol)
            (module!.view as? UINavigationController)?.pushViewController(viewControllerToPush, animated: true)
        case .tabBar:
            let pageOneCoordinator = PageOneCoordinator(moduleType: .home, factory: factory, navigationController: UINavigationController())
            let likeCoordinator = LikeCoordinator(factory: factory, moduleType: .like)
            let cartCoordinator = CartCoordinator(factory: factory, moduleType: .cart)
            let chatCoordinator = ChatCoordinator(factory: factory, moduleType: .chat)
            let profileCoordinator = ProfileCoordinator(moduleType: .profile, factory: factory, navigationController: UINavigationController())
            
            let pageVC = pageOneCoordinator.start()
            let likeVC = likeCoordinator.start()
            let cartVC = cartCoordinator.start()
            let chatVC = chatCoordinator.start()
            let profileVC = profileCoordinator.start()
            let tabBarController = AppTabBarController(viewControllers:
                                                        [pageVC,
                                                        likeVC,
                                                        cartVC,
                                                        chatVC,
                                                        profileVC])
            addCoordinator(coordinator: pageOneCoordinator)
            addCoordinator(coordinator: likeCoordinator)
            addCoordinator(coordinator: cartCoordinator)
            addCoordinator(coordinator: chatCoordinator)
            addCoordinator(coordinator: profileCoordinator)
            (module!.view as? UINavigationController)?.pushViewController(tabBarController, animated: true)
        }
    }
   
    func addCoordinator(coordinator: Coordinatable) {
        guard coordinators.contains(where: { $0 === coordinator }) else {
            return
        }
        coordinators.append(coordinator)
    }

    
    
    func removeCoordinator() {
        coordinators.removeAll()
    }
    
}

