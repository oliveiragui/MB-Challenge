//
//  DetailSnapshotTests.swift
//  CoinAPITests
//
//  Created by Guiherme de Oliveira Macedo on 28/01/24.
//

@testable import CoinAPI
import XCTest
import FBSnapshotTestCase

class DetailSnapshotTests: FBSnapshotTestCase {
    
    // MARK: - Override
    
    override open func setUp() {
        super.setUp()
        
        recordMode = false
    }
    
    func testDetailViewControllerShouldBeShown() {
        // Given
        let model = ExchangeModel(id: "MERCADO_BITCOIN",
                                  name: "MERCADO BITCOIN",
                                  website: "https://www.mercadobitcoin.com.br/",
                                  dateQuoteStart: "2024-01-28T00:00:00.0000000Z",
                                  dateQuoteEnd: "2024-01-28T00:00:00.0000000Z",
                                  dateOrderbookStart: "2024-01-28T00:00:00.0000000Z",
                                  dateOrderbookEnd: "2024-01-28T00:00:00.0000000Z",
                                  dateTradeStart: "2024-01-28T00:00:00.0000000Z",
                                  dateTradeEnd: "2024-01-28T00:00:00.0000000Z",
                                  volumePerHourUSD: 12345.67,
                                  volumePerDayUSD: 123456.78,
                                  volumePerMonthUSD: 1234567.89)
        
        let sut = DetailViewController(model: model)
        
        // When
        addControllerToWindow(sut)
        
        // Then
        FBSnapshotVerifyView(sut.view)

    }
}
