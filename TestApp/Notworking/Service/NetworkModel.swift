//
//  NetworkModel.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 15.03.2023.
//

import Foundation

protocol Answer {}

enum NetworkEnvironment: String {
    case latest = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    case flashSale = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
}

struct Latest: Codable, Answer {
    var category: String
    var name: String
    var price: Int
    var imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case category
        case name
        case price
        case imageUrl = "image_url"
    }
}

struct FlashSale: Codable, Answer {
    var category: String
    var name: String
    var price: Double
    var discount: Int
    var imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case category
        case name
        case price
        case discount
        case imageUrl = "image_url"
    }
}

struct FlashSaleAnswer: Codable {
    var flashSale: [FlashSale]
    
    enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}

struct LatestAnswer: Codable {
    var latest: [Latest]
    
}

