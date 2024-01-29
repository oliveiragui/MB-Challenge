//
//  HomeViewControllerSpy.swift
//  CoinAPIUITests
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

@testable import CoinAPI

class HomeViewControllerSpy: HomeViewModelToControllerDelegate {
    
    var isLoading = false
    var setupCount = 0
    var setupErrorCount = 0

    func startLoading() {
        self.isLoading = true
    }
    
    func stopLoading() {
        self.isLoading = false
    }
    
    func setup(exchanges: [ExchangeModel]) {
        setupCount += 1
    }
    
    func setup(error: String) {
        setupErrorCount += 1
    }
}

