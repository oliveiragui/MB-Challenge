//
//  EndPointType.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

import Foundation

public protocol EndPointType {
    var apiClientKey: String? { get }
    var apiClientSecret: String? { get }
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeader? { get }
}
