//
//  Result.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

import Foundation

public enum Result<T> {
    case Success(T)
    case Failure(Error)
}
