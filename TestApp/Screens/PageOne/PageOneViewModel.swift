//
//  HomeViewModel.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

protocol PageOneViewModelProcol: ViewModelProtocol {
    func getAutocomplete(completion: () -> Void)
    func getData(networkPath: NetworkEnvironment, complition: @escaping ([Answer]) -> Void)
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
    
    func getData(networkPath: NetworkEnvironment, complition: @escaping ([Answer]) -> Void) {
        switch networkPath {
        case .latest:
            networkManager.getData(apiUrl: .latest) { result  in
                let latest = result as! [Latest]
                let arrayLatest = LatestItem.testData(model: latest)
                complition(arrayLatest)
            }
        case .flashSale:
            networkManager.getData(apiUrl: .flashSale) { result in
                let flash = result as! [FlashSale]
                let arrayFlash = FlashSaleItem.testData(model: flash)
                complition(arrayFlash)
            }
        case .autocomplete:
            print("nil")
        }
    }
    
    func getAutocomplete(completion: () -> Void) {
        networkManager.getAutocomplete { result in
            print(result)
            DispatchQueue.main.async {
               resultsList.append(contentsOf: result)
            }
           
        }
        completion()
    }
}
