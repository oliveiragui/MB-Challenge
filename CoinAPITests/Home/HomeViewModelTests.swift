//
//  HomeViewModelTests.swift
//  CoinAPIUITests
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

@testable import CoinAPI
import XCTest

class HomeDataViewModelTests: XCTestCase {
    
    var sut: HomeViewModel!

    private let homeManagerSpy = HomeManagerSpy()
    private let homeCoordinatorSpy = HomeCoordinatorSpy()
    private let controllerSpy = HomeViewControllerSpy()
    
    override func setUp() {
        sut = HomeViewModel(manager: homeManagerSpy, navigationHandler: homeCoordinatorSpy)
        sut.setupView(viewDelegate: controllerSpy)
    }
    
    func testSetupView() {
        sut.viewDelegate = nil
        sut.setupView(viewDelegate: controllerSpy)
        
        XCTAssertNotNil(sut.viewDelegate)
    }
    
    func testFetchExchangesError() {
        
        homeManagerSpy.homeResult = Result.Failure(Errors.resourceNotFound)
        
        sut.fetchExchanges()
        
        XCTAssertFalse(controllerSpy.isLoading)
        XCTAssertEqual(controllerSpy.setupErrorCount, 1)
    }
    
    func testFetchExchangesSuccess() {
        sut.fetchExchanges()
        
        XCTAssertEqual(controllerSpy.setupCount, 1)
        XCTAssertFalse(controllerSpy.isLoading)
    }
    
    func testOpenExchangeDetail() {
        sut.openExchangeDetail(exchange: ExchangeModel(id: "MERCADO_BITCOIN", name: "MERCADO BITCOIN", volumePerHourUSD: 12345.67, volumePerDayUSD: 1234567.89, volumePerMonthUSD: 123456.89))
        
        XCTAssertEqual(homeCoordinatorSpy.openExchangeDetailCount, 1)
    }
}

