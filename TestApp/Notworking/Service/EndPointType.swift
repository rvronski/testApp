//
//  EndPointType.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 14.03.2023.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
