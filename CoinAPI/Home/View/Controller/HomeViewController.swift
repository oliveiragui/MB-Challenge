//
//  HomeViewController.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var homeView: HomeView = {
        let view = HomeView(model: HomeView.Model(exchanges: []), delegate: self)
        return view
    }()
    
    var viewModel: HomeViewModelProtocol?
    weak var viewDelegate: HomeViewDelegate?

    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewDelegate = homeView
        self.viewModel?.setupView(viewDelegate: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .blue
        
        homeView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(homeView)
        
        homeView.anchor(left: view.leftAnchor, right: view.rightAnchor)
        homeView.anchor(top: view.topAnchor, bottom: view.bottomAnchor)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Exchanges"

        fetchExchanges()
    }
}

extension HomeViewController: HomeViewControllerDelegate {
    func openExchangeDetail(exchange: ExchangeModel) {
        viewModel?.openExchangeDetail(exchange: exchange)
    }
    
    func fetchExchanges() {
        viewModel?.fetchExchanges()
    }
}

extension HomeViewController: HomeViewModelToControllerDelegate {
    func setup(error: String) {
        viewDelegate?.setup(error: error)
    }
    
    func setup(exchanges: [ExchangeModel]) {
        viewDelegate?.setup(exchanges: exchanges)
    }
    
    func startLoading() {
        viewDelegate?.startLoading()
    }
    
    func stopLoading() {
        viewDelegate?.stopLoading()
    }
}
