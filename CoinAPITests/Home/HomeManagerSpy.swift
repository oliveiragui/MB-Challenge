//
//  HomeManagerSpy.swift
//  CoinAPIUITests
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

@testable import CoinAPI

final class HomeManagerSpy: HomeManagerProtocol {
    
    
    var homeModel: [ExchangeModel]!
    var homeResult: CoinAPI.Result<[CoinAPI.ExchangeModel]>!
    
    init() {
        homeModel = [ExchangeModel(id: "MERCADO_BITCOIN", name: "MERCADO BITCOIN", volumePerHourUSD: 12345.67, volumePerDayUSD: 1234567.89, volumePerMonthUSD: 123456.89)]
        homeResult = .Success(homeModel)
    }

    func fetchExchanges(completion: @escaping (CoinAPI.Result<[CoinAPI.ExchangeModel]>) -> Void) {
        completion(homeResult)
    }
}
