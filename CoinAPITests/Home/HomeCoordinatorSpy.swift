//
//  HomeCoordinatorSpy.swift
//  CoinAPIUITests
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

@testable import CoinAPI

class HomeCoordinatorSpy: HomeViewNavigationHandler {
    var openExchangeDetailCount = 0

    func openExchangeDetail(exchange: CoinAPI.ExchangeModel) {
        openExchangeDetailCount += 1
    }
}

