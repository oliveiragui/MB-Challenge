//
//  DetailCoordinator.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 28/01/24.
//

import Foundation
import UIKit

class DetailCoordinator: BaseCoordinator {
    
    public required init(with configuration: CoordinatorConfiguration, parentCoordinator: BaseCoordinator? = nil, delegate: BaseCoordinatorDelegate? = nil) {
        super.init(with: configuration, parentCoordinator: parentCoordinator, delegate: delegate)
    }
    
    public func start(exchange: ExchangeModel) {
        let vc = DetailViewController(model: exchange)
        
        show(viewController: vc, as: .push(animated: false))
    }
}
