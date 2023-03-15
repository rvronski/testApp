//
//  HomeViewModel.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

protocol PageOneViewModelProcol: ViewModelProtocol {
    func getImage(completion: @escaping (UIImage?) -> ())
    func returnToLogin()
}

class PageOneViewModel: PageOneViewModelProcol {
    enum ViewInput {
        case pushPageTwo
    }
    var coordinator: PageOneCoordinator!
    
    private let networkManager: NetworkProtocol

    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
    
    
    func returnToLogin() {
        coordinator.popToLogin()
    }
    
    func getImage(completion: @escaping (UIImage?) -> ()) {
        networkManager.getData(apiUrl: .latest) { result in
            let dan = result.first as! Latest
            let latest = dan.imageUrl
            let url =  URL(string:latest)
            do {
                let image = try Data(contentsOf: url!)
                completion(UIImage(data: image) ?? UIImage(systemName: "person"))
            } catch {
                print(error)
            }
            
        }
    }
//    func viewInputDidChange(viewInput: ViewInput) {
//        switch viewInput {
//            
//        case .pushPageTwo:
//            <#code#>
//        }
//    }
}
