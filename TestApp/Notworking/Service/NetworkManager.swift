//
//  NetworkManager.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 15.03.2023.
//

import Foundation

//protocol Network: AnyObject {
//    associatedtype EndPoint: Codable
//    func getNowWeather(url: NetworkEnvironment, answer: EndPoint,  completion: @escaping (Codable) -> Void)
//}

class NetworkManager  {
typealias Flash = FlashSaleAnswer
typealias  Latest = LatestAnswer
    
    func getNowWeather(apiUrl: NetworkEnvironment, completion: @escaping (Codable) -> Void) {
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
                    completion(answer)
                    print(answer)
                } else {
                    let answer = try JSONDecoder().decode(Latest.self, from: data)
                    completion(answer)
                    print(answer)
                }
               
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    
}
