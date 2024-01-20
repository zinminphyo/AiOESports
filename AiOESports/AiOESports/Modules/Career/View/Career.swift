//
//  Career.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import UIKit

class Career: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet private(set) var emptyView: UIView!
    
    private var careerLists: [CareerModel] = []
    
    
    var presenter: CareerPresenting?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
        
        presenter?.viewDidLoad()
    }
    
    private func configureHierarchy() {
        configureContainerView()
        configureTableView()
    }
    
    private func configureContainerView() {
        self.view.backgroundColor = Colors.Theme.inputColor
    }
    
    private func configureTableView() {
        tableView.backgroundColor = UIColor.clear
        tableView.register(UINib(nibName: String(describing: FormerPlayerTableViewCell.self), bundle: nil), forCellReuseIdentifier: FormerPlayerTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }

}


// MARK: - Career View Delegate
extension Career: CareerViewDelegate {
    func renderCareerLists(lists: [CareerModel]) {
        self.careerLists = lists
        self.tableView.reloadData()
        emptyView.alpha = lists.isEmpty ? 1.0 : 0.0
    }
}


// MARK: - UITableView DataSource
extension Career: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return careerLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FormerPlayerTableViewCell.reuseIdentifier, for: indexPath) as? FormerPlayerTableViewCell else { return UITableViewCell() }
        cell.updateUI(careerModel: careerLists[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return FormerPlayerTableViewCell.cellHeight
    }
}
