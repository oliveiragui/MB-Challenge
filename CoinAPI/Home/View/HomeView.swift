//
//  HomeView.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

import Foundation
import UIKit

class SubtitleTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HomeView: BaseView<HomeView.Model>, UITableViewDelegate, UITableViewDataSource {
    
    struct Constants {
        static let spacing: CGFloat = 10
        
        static let constraint0: CGFloat = 0
    }
    
    struct Model: BaseViewData {
        var exchanges: [ExchangeModel]
    }
    
    var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = Constants.spacing
        view.contentMode = .scaleToFill
        
        return view
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isHidden = true
        
        return table
    }()
    
    private let loadingIcon = LoadingView()
    
    private let errorView = ErrorView()
    
    weak var delegate: HomeViewControllerDelegate?
    
    init(model: HomeView.Model, delegate: HomeViewControllerDelegate) {
        self.delegate = delegate
        super.init(model: model, frame: .zero)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {
        super.configure()
        
        backgroundColor = .white
        
        errorView.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        
        tableView.reloadData()
        
    }
    
    override func didUpdateModel() {
        tableView.reloadData()
    }
    
    override func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(loadingIcon)
        stackView.addArrangedSubview(errorView)
        stackView.addArrangedSubview(tableView)
    }
    
    override func addConstraints() {
        let margins = safeAreaLayoutGuide
        
        stackView.anchor(top: margins.topAnchor, bottom: margins.bottomAnchor, paddingTop: Constants.constraint0, paddingBottom: Constants.constraint0)
        stackView.anchor(left: margins.leftAnchor, right: margins.rightAnchor, paddingLeft: Constants.constraint0, paddingRight: Constants.constraint0)
        
        loadingIcon.center = self.center
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.exchanges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let exchange = model.exchanges[indexPath.row]
        
        cell.textLabel?.text = exchange.name
        cell.textLabel?.textColor = .black
        cell.backgroundColor = .white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exchange = model.exchanges[indexPath.row]
        delegate?.openExchangeDetail(exchange: exchange)
    }
}

extension HomeView: HomeViewDelegate {
    func setup(error: String) {
        tableView.isHidden = true
        
        errorView.isHidden = false
        
        errorView.configure(withMessage: error, retryAction: {
            self.startLoading()
            self.delegate?.fetchExchanges()
        })
    }
    
    func setup(exchanges: [ExchangeModel]) {
        self.model.exchanges = exchanges
        
        errorView.isHidden = true
        tableView.isHidden = false
    }
    
    func startLoading() {
        errorView.isHidden = true
        tableView.isHidden = true
        
        loadingIcon.isHidden = false
        loadingIcon.startAnimating()
    }
    
    func stopLoading() {
        loadingIcon.isHidden = true
        
        loadingIcon.stopAnimating()
    }
}
