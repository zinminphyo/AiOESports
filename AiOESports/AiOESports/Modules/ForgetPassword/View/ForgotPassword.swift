//
//  ForgotPassword.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 17/05/2023.
//

import UIKit

class ForgotPassword: UIViewController {

    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureTitleLabel()
        configureTableView()
    }
    
    private func configureTitleLabel() {
        headerTitleLabel.font = Fonts.subtitleFont
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: String(describing: PhNumTableCell.self), bundle: nil), forCellReuseIdentifier: PhNumTableCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func didTapBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}

extension ForgotPassword: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhNumTableCell.reuseIdentifier, for: indexPath) as? PhNumTableCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
