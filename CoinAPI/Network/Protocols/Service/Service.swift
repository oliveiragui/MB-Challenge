//
//  Service.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

import Foundation

public protocol Service {
    associatedtype EndPoint: EndPointType
}

extension Service {
    public var manager: NetworkManager<EndPoint> {
        return NetworkManager<EndPoint>()
    }
    
}
