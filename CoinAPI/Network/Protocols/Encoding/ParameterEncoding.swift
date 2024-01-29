//
//  ParameterEncoding.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

import Foundation

public typealias Parameters = [String : Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
