//
//  ExchangeModel.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

import Foundation

struct ExchangeModel: Codable {
    var id: String?
    var name: String?
    var website: String?
    var dateQuoteStart: String?
    var dateQuoteEnd: String?
    var dateOrderbookStart: String?
    var dateOrderbookEnd: String?
    var dateTradeStart: String?
    var dateTradeEnd: String?
    var volumePerHourUSD: Double
    var volumePerDayUSD: Double
    var volumePerMonthUSD: Double
}

extension ExchangeModel {
    enum CodingKeys: String, CodingKey {
        case id = "exchange_id"
        case name = "name"
        case website = "website"
        case dateQuoteStart = "data_quote_start"
        case dateQuoteEnd = "data_quote_end"
        case dateOrderbookStart = "data_orderbook_start"
        case dateOrderbookEnd = "data_orderbook_end"
        case dateTradeStart = "data_trade_start"
        case dateTradeEnd = "data_trade_end"
        case volumePerHourUSD = "volume_1hrs_usd"
        case volumePerDayUSD = "volume_1day_usd"
        case volumePerMonthUSD = "volume_1mth_usd"
    }
}
