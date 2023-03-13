//
//  Coordinatable.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

protocol Coordinatable: AnyObject {
    
    var coordinators: [Coordinatable] { get }
    func addCoordinator(coordinator: Coordinatable)
    func removeCoordinator()
    func start() -> UIViewController
}

protocol ModuleCoordinatable: Coordinatable {
    var module: Module? { get }
    var moduleType: Module.ModuleType { get }
}

extension Coordinatable {
    func addCoordinator(coordinator: Coordinatable) {}
    func removeCoordinator() {}
}
