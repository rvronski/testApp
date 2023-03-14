//
//  NetworkRouter.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 14.03.2023.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: AnyObject {
    associatedtype EndPoint: EndPointType
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    
    func cancel()
}
