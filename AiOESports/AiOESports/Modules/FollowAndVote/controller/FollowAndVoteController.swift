//
//  FollowAndVoteController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit

class FollowAndVoteController: UIViewController {
    
    @IBOutlet private(set) var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }
    
    
    private func configureHierarchy() {
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: String(describing: FollowAndVoteCell.self), bundle: nil), forCellReuseIdentifier: FollowAndVoteCell.reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.sectionHeaderTopPadding = 0
        tableView.dataSource = self
        tableView.delegate = self
    }
    

    @IBAction
    private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}


extension FollowAndVoteController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FollowAndVoteCell.reuseIdentifier, for: indexPath) as! FollowAndVoteCell
        return cell
    }
}


extension FollowAndVoteController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 30
    }
}
