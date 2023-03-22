//
//  NetworkManager.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 15.03.2023.
//

import Foundation

protocol NetworkProtocol: AnyObject {
    func getData(apiUrl: NetworkEnvironment, completion: @escaping ([Answer]) -> Void)
    func getAutocomplete(completion: @escaping ([String]) -> Void)
}

class NetworkManager: NetworkProtocol  {
    typealias Flash = FlashSaleAnswer
    typealias  Latest = LatestAnswer
    
    func getData(apiUrl: NetworkEnvironment, completion: @escaping ([Answer]) -> Void) {
        let urlString = apiUrl.rawValue
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error {
                print(error.localizedDescription)
                return
            }
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            if statusCode != 200 {
                print("Status Code = \(String(describing: statusCode))")
                return
            }
            guard let data else {
                print("data = nil")
                return
            }
            do {
                if apiUrl == .flashSale {
                    let answer = try JSONDecoder().decode(Flash.self, from: data)
                    let data = answer.flashSale
                    completion(data)
                    print(answer)
                }
                if apiUrl == .latest {
                    let answer = try JSONDecoder().decode(Latest.self, from: data)
                    let data = answer.latest
                    completion(data)
                    print(answer)
                }
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func getAutocomplete(completion: @escaping ([String]) -> Void) {
        let urlString = NetworkEnvironment.autocomplete.rawValue
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error {
                print(error.localizedDescription)
                return
            }
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            if statusCode != 200 {
                print("Status Code = \(String(describing: statusCode))")
                return
            }
            guard let data else {
                print("data = nil")
                return
            }
            do {
                let answer = try JSONDecoder().decode(Autocomplete.self, from: data)
                let data = answer.words
                completion(data)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}

