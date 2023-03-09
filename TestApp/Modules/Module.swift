//
//  Module.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import Foundation

protocol ViewModelProtocol: AnyObject {}

struct Module {
    
    enum ModuleType {
        case home
        case like
        case cart
        case chat
        case profile
    }
}
