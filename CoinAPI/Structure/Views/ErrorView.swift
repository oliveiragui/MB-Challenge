//
//  ErrorView.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 28/01/24.
//

import UIKit

class ErrorView: UIView {
    
    struct Constants {
        static let iconFrame: CGFloat = 50
        
        static let paddingTop: CGFloat = 8
        
        static let paddingTopButton: CGFloat = 16
        
        static let paddingSides: CGFloat = 8
        
        static let numberOfLines = 0
        
        static let cornerRadius: CGFloat = 8
        
        static let buttonWidth: CGFloat = 160
        
        static let buttonHeight: CGFloat = 40
    }
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "exclamationmark.triangle.fill")
        imageView.tintColor = .red
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "An error occurred."
        label.textAlignment = .center
        label.numberOfLines = Constants.numberOfLines
        return label
    }()
    
    private let retryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tente novamente", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = Constants.cornerRadius
        return button
    }()
    
    private var retryButtonAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        backgroundColor = .white
        
        addSubview(iconImageView)
        addSubview(messageLabel)
        addSubview(retryButton)
        
        iconImageView.anchor(horizontal: centerXAnchor, vertical: centerYAnchor, paddingVertical: -Constants.iconFrame)
        iconImageView.anchor(width: Constants.iconFrame, height: Constants.iconFrame)
        
        messageLabel.anchor(top: iconImageView.bottomAnchor, paddingTop: Constants.paddingTop)
        messageLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, paddingLeading: Constants.paddingSides, paddingTrailing: Constants.paddingSides)
        
        retryButton.anchor(top: messageLabel.bottomAnchor, paddingTop: Constants.paddingTopButton)
        retryButton.anchor(horizontal: centerXAnchor)
        retryButton.anchor(width: Constants.buttonWidth, height: Constants.buttonHeight)
    }
    
    func configure(withMessage message: String, retryAction: (() -> Void)?) {
        messageLabel.text = message
        retryButtonAction = retryAction
        retryButton.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
    }
    
    @objc private func retryButtonTapped() {
        retryButtonAction?()
    }
}
