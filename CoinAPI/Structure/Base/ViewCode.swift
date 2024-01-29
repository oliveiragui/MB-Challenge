//
//  ViewCode.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

import Foundation

public protocol ViewCode {
    func loadView()
    func addSubviews()
    func addConstraints()
}

public extension ViewCode {
    func loadView() {
        addSubviews()
        addConstraints()
    }
}
