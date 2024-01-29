//
//  CoinAPIEndPoint.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

import Foundation

enum CoinAPIEndPoint {
    case listExchanges
}

extension CoinAPIEndPoint: EndPointType {
    var apiClientKey: String? {
        return "9FCF7A94-A467-42F1-9E99-3927214599BD"
    }
    
    var apiClientSecret: String? {
        return nil
    }
    
    var baseURLString : String {
        return "https://rest.coinapi.io/v1/"
    }
    
    var baseURL: URL {
        guard let url = URL(string: baseURLString) else {
            fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        
        case .listExchanges:
            return "exchanges"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
            
        case .listExchanges:
            return .requestWithHeaders(bodyParameters: nil, urlParameters: nil, additionalHeaders: ["X-CoinAPI-Key": apiClientKey ?? ""])
        }
    }
    
    var headers: HTTPHeader? {
        switch self {
            
        case .listExchanges:
            return ["X-CoinAPI-Key": apiClientKey ?? ""]
        }
    }
}
