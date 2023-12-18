//
//  Achivement.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import UIKit

class Achivement: UIViewController {
    
    @IBOutlet weak var achivementTableView: UITableView!
    @IBOutlet private(set) var emptyView: UIView!
    
    var presenter: AchivementPresenting?
    
    private var achivementLists: [AchivementModel] = []
    
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
        achivementTableView.register(UINib(nibName: String(describing: AchivementTableViewCell.self), bundle: nil), forCellReuseIdentifier: AchivementTableViewCell.reuseIdentifier)
        achivementTableView.dataSource = self
        achivementTableView.delegate = self
        achivementTableView.separatorStyle = .none
        achivementTableView.backgroundColor = Colors.Theme.inputColor
        achivementTableView.isScrollEnabled = true
    }

}


extension Achivement: AchivementViewDelegate {
    func updateUI(achivement: [AchivementModel]) {
        self.achivementLists = achivement
        self.achivementTableView.reloadData()
        emptyView.isHidden = !achivement.isEmpty
    }
}

extension Achivement: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achivementLists.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AchivementTableViewCell.reuseIdentifier, for: indexPath) as? AchivementTableViewCell else { return UITableViewCell() }
        cell.renderUI(achivement: achivementLists[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AchivementTableViewCell.cellHeight
    }
}
