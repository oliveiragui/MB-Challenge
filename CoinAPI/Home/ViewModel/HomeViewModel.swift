//
//  HomeViewModel.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

import Foundation
import UIKit

class HomeViewModel: HomeViewModelProtocol {
    
    weak var navigationHandler: HomeViewNavigationHandler?
    weak var viewDelegate: HomeViewModelToControllerDelegate?
    private let homeManager: HomeManagerProtocol
    
    init(manager: HomeManagerProtocol, navigationHandler: HomeViewNavigationHandler) {
        self.navigationHandler = navigationHandler
        self.homeManager = manager
    }
    
    func fetchExchanges() {
        self.viewDelegate?.startLoading()
        
        homeManager.fetchExchanges() { [weak self] result in
            switch result {
            case .Success(let response):
                let filterResponse = response.filter { $0.name != nil }
                self?.viewDelegate?.setup(exchanges: filterResponse)
                self?.viewDelegate?.stopLoading()
            case .Failure:
                self?.viewDelegate?.setup(error: "Ocorreu um erro ao listar as exchanges.")
                self?.viewDelegate?.stopLoading()
            }
        }
    }
    
    func openExchangeDetail(exchange: ExchangeModel) {
        self.navigationHandler?.openExchangeDetail(exchange: exchange)
    }
    
    func setupView(viewDelegate: HomeViewModelToControllerDelegate) {
        self.viewDelegate = viewDelegate
    }
}
