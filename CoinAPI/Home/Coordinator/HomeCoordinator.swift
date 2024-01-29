//
//  HomeCoordinator.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

import Foundation
import UIKit

class HomeCoordinator: BaseCoordinator {
    
    public required init(with configuration: CoordinatorConfiguration, parentCoordinator: BaseCoordinator? = nil, delegate: BaseCoordinatorDelegate? = nil) {
        super.init(with: configuration, parentCoordinator: parentCoordinator, delegate: delegate)
    }
    
    public func start(navigationController: UINavigationController?) {
        let manager = HomeManager()
        
        let viewModel = HomeViewModel(manager: manager, navigationHandler: self)

        let vc = HomeViewController(viewModel: viewModel)
        
        navigationController?.pushViewController(vc, animated: false)
    }
}

extension HomeCoordinator: HomeViewNavigationHandler {
    func openExchangeDetail(exchange: ExchangeModel) {
        let coordinator = DetailCoordinator(with: configuration, parentCoordinator: self)
        coordinator.start(exchange: exchange)
    }
}

