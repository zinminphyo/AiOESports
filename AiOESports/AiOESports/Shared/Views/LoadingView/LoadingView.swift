//
//  LoadingView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 18/11/2023.
//

import UIKit

class LoadingView: UIView {
    
    
    private var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.hidesWhenStopped = true
        return view
    }()
    
    @IBInspectable var isLoading: Bool {
        set { newValue ? showLoading() : hideLoading() }
        get { isHidden }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureLoadingView()
    }
    
    private func configureLoadingView() {
        layer.cornerRadius = 10
        layer.cornerCurve = .continuous
        addSubview(indicatorView)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func showLoading() {
        isHidden = false
        indicatorView.startAnimating()
    }
    
    func hideLoading() {
        isHidden = true
        indicatorView.stopAnimating()
    }

}
