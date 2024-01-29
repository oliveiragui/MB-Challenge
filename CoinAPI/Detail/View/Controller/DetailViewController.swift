//
//  DetailViewController.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 28/01/24.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    private lazy var detailView: DetailView = {
        let view = DetailView(model: DetailView.Model(exchange: model))
        return view
    }()
    
    let model: ExchangeModel

    init(model: ExchangeModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .blue
        
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(detailView)
        
        detailView.anchor(left: view.leftAnchor, right: view.rightAnchor)
        detailView.anchor(top: view.topAnchor, bottom: view.bottomAnchor)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Exchange Details"
        navigationItem.titleView?.backgroundColor = .black
    }
}
