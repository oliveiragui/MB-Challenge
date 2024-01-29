//
//  DetailView.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 28/01/24.
//

import Foundation
import UIKit

class DetailView: BaseView<DetailView.Model> {
    
    struct Constants {
        static let spacing: CGFloat = 10
        
        static let fontSize: CGFloat = 24
        
        static let margin: CGFloat = 16
    }
    
    struct Model: BaseViewData {
        var exchange: ExchangeModel
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: Constants.fontSize, weight: .bold)
        return label
    }()
    
    let websiteLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        return label
    }()
    
    let dataQuoteStartLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        
        return label
    }()
    
    let dataQuoteEndLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        
        return label
    }()
    
    let dataOrderbookStartLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        
        return label
    }()
    
    let dataOrderbookEndLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        
        return label
    }()
    
    let dataTradeStartLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        
        return label
    }()
    
    let dataTradeEndLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        
        return label
    }()
    
    let graphView: GraphView = {
        let view = GraphView()
        view.backgroundColor = .white
        return view
    }()
    
    
    init(model: DetailView.Model) {
        super.init(model: model, frame: .zero)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {
        super.configure()
        
        addSubviews()
        displayExchangeInfo()
        
    }
    
    override func addSubviews() {
        addSubview(scrollView)
        
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(websiteLabel)
        scrollView.addSubview(dataQuoteStartLabel)
        scrollView.addSubview(dataQuoteEndLabel)
        scrollView.addSubview(dataOrderbookStartLabel)
        scrollView.addSubview(dataOrderbookEndLabel)
        scrollView.addSubview(dataTradeStartLabel)
        scrollView.addSubview(dataTradeEndLabel)
        scrollView.addSubview(graphView)
        
    }
    
    override func addConstraints() {
        scrollView.anchor(top: safeAreaLayoutGuide.topAnchor, bottom: safeAreaLayoutGuide.bottomAnchor)
        scrollView.anchor(leading: leadingAnchor, trailing: trailingAnchor)
        
        nameLabel.anchor(top: safeAreaLayoutGuide.topAnchor)
        nameLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, paddingLeading: Constants.margin, paddingTrailing: Constants.margin)
        
        websiteLabel.anchor(top: nameLabel.bottomAnchor, paddingTop: Constants.margin)
        websiteLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, paddingLeading: Constants.margin, paddingTrailing: Constants.margin)
        
        dataQuoteStartLabel.anchor(top: websiteLabel.bottomAnchor, paddingTop: Constants.margin)
        dataQuoteStartLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, paddingLeading: Constants.margin, paddingTrailing: Constants.margin)
        
        dataQuoteEndLabel.anchor(top: dataQuoteStartLabel.bottomAnchor, paddingTop: Constants.margin)
        dataQuoteEndLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, paddingLeading: Constants.margin, paddingTrailing: Constants.margin)
        
        dataOrderbookStartLabel.anchor(top: dataQuoteEndLabel.bottomAnchor, paddingTop: Constants.margin)
        dataOrderbookStartLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, paddingLeading: Constants.margin, paddingTrailing: Constants.margin)
        
        dataOrderbookEndLabel.anchor(top: dataOrderbookStartLabel.bottomAnchor, paddingTop: Constants.margin)
        dataOrderbookEndLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, paddingLeading: Constants.margin, paddingTrailing: Constants.margin)
        
        dataTradeStartLabel.anchor(top: dataOrderbookEndLabel.bottomAnchor, paddingTop: Constants.margin)
        dataTradeStartLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, paddingLeading: Constants.margin, paddingTrailing: Constants.margin)
        
        dataTradeEndLabel.anchor(top: dataTradeStartLabel.bottomAnchor, paddingTop: Constants.margin)
        dataTradeEndLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, paddingLeading: Constants.margin, paddingTrailing: Constants.margin)
        
        graphView.anchor(top: dataTradeEndLabel.bottomAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, paddingTop: Constants.margin, paddingBottom: Constants.margin)
        graphView.anchor(leading: leadingAnchor, trailing: trailingAnchor, paddingLeading: Constants.margin, paddingTrailing: Constants.margin)
        
    }
    
    private func displayExchangeInfo() {
        nameLabel.text = model.exchange.name
        websiteLabel.text = model.exchange.website
        websiteLabel.isUserInteractionEnabled = true
        websiteLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openWebsite)))
        
        dataQuoteStartLabel.text = "Date Quote Start: \(convertJSONDateString(model.exchange.dateQuoteStart ?? ""))"
        dataQuoteEndLabel.text = "Date Quote End: \(convertJSONDateString(model.exchange.dateQuoteEnd ?? ""))"
        dataOrderbookStartLabel.text = "Date Orderbook Start: \(convertJSONDateString(model.exchange.dateOrderbookStart ?? ""))"
        dataOrderbookEndLabel.text = "Date Orderbook End: \(convertJSONDateString(model.exchange.dateOrderbookEnd ?? ""))"
        dataTradeStartLabel.text = "Date Trade Start: \(convertJSONDateString(model.exchange.dateTradeStart ?? ""))"
        dataTradeEndLabel.text = "Date Trade End: \(convertJSONDateString(model.exchange.dateTradeEnd ?? ""))"
        
        graphView.updateGraph(volume1Hrs: model.exchange.volumePerHourUSD,
                              volume1Day: model.exchange.volumePerDayUSD,
                              volume1Month: model.exchange.volumePerMonthUSD, segmentLabels: ["Volume Per Hour", "Volume Per Day", "Volume Per Month"])
    }
    
    @objc private func openWebsite() {
        if let website = model.exchange.website, let url = URL(string: website) {
            UIApplication.shared.open(url)
        }
    }
    
    func convertJSONDateString(_ jsonString: String) -> String {
        let jsonDateFormatter = DateFormatter()
        jsonDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = jsonDateFormatter.date(from: jsonString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd/MM/yyyy"
            return outputFormatter.string(from: date)
        }
        
        return ""
    }
}
