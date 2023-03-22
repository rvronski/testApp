//
//  PageOneModel.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 16.03.2023.
//

import Foundation
import UIKit


struct PageOneModel {
    var menuImage = ["menuPhone","menuHeadphones","menuGames","menuCar","menuBed","menuRobot","menuPhone","menuHeadphones","menuGames","menuCar","menuBed","menuRobot"]
    var menuDescription = ["Phones","Headphones","Games","Cars","Furniture","Kids","Phones","Headphones","Games","Cars","Furniture","Kids"]
    
    var brandsImage = ["apple","newbalanceLogo","nikeLogo","reeboklogo"]
    
}

struct LatestItem: Hashable {
    var category: String
    var name: String
    var price: Int
    var discount: Int?
    var imageUrl: UIImage
    var id: UUID
    
}
extension LatestItem: Answer {
    static func testData(model: [Latest]) -> [LatestItem] {
        var array = [LatestItem]()
        for latest in model {
            let category = latest.category
            let name = latest.name
            let price = latest.price
            let imageUrl = {
                let image = latest.imageUrl
                let url =  URL(string: image)
                do {
                    let imageURL = try Data(contentsOf: url!)
                    return UIImage(data: imageURL) ?? UIImage(systemName: "person")!
                } catch {
                    print(error)
                }
                return UIImage(named: "samsung")!
            }()
            let id = UUID()
            let item = LatestItem(category: category, name: name, price: price, imageUrl: imageUrl, id: id)
            array.append(item)
        }
        return array
    }
}
    struct FlashSaleItem {
        var category: String
        var name: String
        var price: Double
        var discount: Int?
        var imageUrl: UIImage
        var id: UUID
    }
    
extension FlashSaleItem: Answer {
        static func testData(model: [FlashSale]) -> [FlashSaleItem] {
            var array = [FlashSaleItem]()
            for flash in model {
                let category = flash.category
                let name = flash.name
                let price = flash.price
                let discount = flash.discount
                let imageUrl = {
                    let image = flash.imageUrl
                    let url =  URL(string: image)
                do {
                   let imageURL = try Data(contentsOf: url!)
                    return UIImage(data: imageURL) ?? UIImage(systemName: "person")!
                } catch {
                    print(error)
                }
                return UIImage(named: "samsung")!
            }()
            let id = UUID()
            let item = FlashSaleItem(category: category, name: name, price: price, discount: discount, imageUrl: imageUrl, id: id)
            array.append(item)
        }
            return array
    }
}
