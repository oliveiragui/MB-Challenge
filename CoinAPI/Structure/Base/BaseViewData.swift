//
//  BaseViewData.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

import Foundation

public protocol BaseViewData { }

extension Optional: BaseViewData where Wrapped: BaseViewData { }

public protocol UpdatableModel {
    
    associatedtype M: BaseViewData
    
    var model: M { get set }

    func didUpdateModel()
}
