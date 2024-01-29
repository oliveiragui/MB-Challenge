//
//  LoadingView.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 28/01/24.
//

import UIKit

class LoadingView: UIView {
    
    struct Constants {
        static let paddingTop: CGFloat = 8
        
        static let paddingLeading: CGFloat = 16

        static let paddingTrailing: CGFloat = 16
    }

    private let activityIndicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .gray
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Carregando..."
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        addSubview(activityIndicatorView)
        addSubview(messageLabel)
        
        activityIndicatorView.anchor(horizontal: centerXAnchor)
        activityIndicatorView.anchor(vertical: centerYAnchor, paddingVertical: -activityIndicatorView.frame.height)
        
        messageLabel.anchor(top: activityIndicatorView.bottomAnchor, paddingTop: Constants.paddingTop)
        messageLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, paddingLeading: Constants.paddingLeading, paddingTrailing: Constants.paddingTrailing)
    }

    func startAnimating() {
        activityIndicatorView.startAnimating()
    }

    func stopAnimating() {
        activityIndicatorView.stopAnimating()
    }
}
