//
//  LoadingTableViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/04/2023.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {
    
    
    private let containerView = UIView(frame: .zero)
    private let activityView = UIActivityIndicatorView(frame: .zero)
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        selectionStyle = .none
    }
    
    private func configureHierarchy() {
        configureContainerView()
        configureIndicatorView()
    }
    
    
    private func configureContainerView() {
        self.addSubview(containerView)
        self.backgroundColor = UIColor.clear
        containerView.backgroundColor = Colors.Theme.mainColor
        containerView.layer.cornerRadius = 10
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    
    private func configureIndicatorView() {
        containerView.addSubview(activityView)
        activityView.style = .medium
        activityView.color = UIColor.white
        activityView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            activityView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            activityView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            activityView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0)
        ])
    }
    
    func startAnimation() {
        activityView.startAnimating()
    }

}
