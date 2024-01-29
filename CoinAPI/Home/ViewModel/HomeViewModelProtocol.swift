//
//  HomeViewModelProtocol.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

import Foundation

protocol HomeViewControllerDelegate: AnyObject {
    func openExchangeDetail(exchange: ExchangeModel)
    func fetchExchanges()
}

protocol HomeViewModelProtocol: AnyObject {
    func openExchangeDetail(exchange: ExchangeModel)
    func fetchExchanges()
    func setupView(viewDelegate: HomeViewModelToControllerDelegate)
}

protocol HomeViewNavigationHandler: AnyObject {
    func openExchangeDetail(exchange: ExchangeModel)
}

protocol HomeViewModelToControllerDelegate: AnyObject {
    func setup(exchanges: [ExchangeModel])
    func startLoading()
    func stopLoading()
    func setup(error: String)
}

protocol HomeViewDelegate: AnyObject {
    func setup(exchanges: [ExchangeModel])
    func startLoading()
    func stopLoading()
    func setup(error: String)
}
