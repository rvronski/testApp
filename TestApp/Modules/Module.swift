//
//  Module.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

protocol ViewModelProtocol: AnyObject {}

struct Module {
    
    enum ModuleType {
        case home
        case like
        case cart
        case chat
        case profile
    }
    
    let moduleType: ModuleType
    let viewModel: ViewModelProtocol
    let view: UIViewController
}
extension Module.ModuleType {
    var tabBarItem: UITabBarItem {
        switch self {
            
        case .home:
            return UITabBarItem(title: nil,image: UIImage(systemName: "house"), tag: 0)
        case .like:
            return UITabBarItem(title: nil,image: UIImage(systemName: "heart"), tag: 1)
        case .cart:
            return UITabBarItem(title: nil,image: UIImage(systemName: "cart"), tag: 2)
        case .chat:
            return UITabBarItem(title: nil,image: UIImage(systemName: "bubble.right"), tag: 3)
        case .profile:
            return UITabBarItem(title: nil,image: UIImage(systemName: "person"), tag: 4)
        }
    }
}
