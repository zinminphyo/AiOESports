//
//  ShieldHistoryController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 19/01/2024.
//

import UIKit

class ShieldHistoryController: UIViewController {
    
    @IBOutlet private(set) var historyLists: UITableView!
    @IBOutlet private(set) var historyListsHeight: NSLayoutConstraint!
    @IBOutlet private(set) var contentScrollView: UIScrollView!
    @IBOutlet private(set) var contentContainerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureScrollView()
        configureShieldLists()
        configureContentContainerView()
    }
    
    private func configureScrollView() {
        contentScrollView.contentInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
    }
    
    private func configureContentContainerView() {
        contentContainerView.layer.borderColor = Colors.Text.secondaryText?.cgColor
        contentContainerView.layer.borderWidth = 1
    }
    
    private func configureShieldLists() {
        historyLists.register(UINib(nibName: String(describing: ShieldHistoryCell.self), bundle: nil), forCellReuseIdentifier: ShieldHistoryCell.reuseIdentifier)
        historyLists.separatorStyle = .none
        historyLists.dataSource = self
        historyLists.delegate = self
        historyListsHeight.constant = ShieldHistoryCell.height * CGFloat(5)
        view.invalidateIntrinsicContentSize()
    }

    @IBAction
    private func didTapBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}


extension ShieldHistoryController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShieldHistoryCell.reuseIdentifier, for: indexPath) as! ShieldHistoryCell
        return cell
    }
}


extension ShieldHistoryController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ShieldHistoryCell.height
    }
}
