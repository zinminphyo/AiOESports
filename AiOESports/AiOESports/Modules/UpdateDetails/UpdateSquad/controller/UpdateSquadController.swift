//
//  UpdateSquadController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 16/01/2024.
//

import UIKit

class UpdateSquadController: UIViewController {
    
    @IBOutlet private(set) var lists: UITableView!
    
    private let vm: UpdateSquadViewModel!
    
    init(lists: [UpdateSquadTableViewCell.SquadModel]) {
        vm = UpdateSquadViewModel(_lists: lists)
        super.init(nibName: "UpdateSquadController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Dosen't support for this NSCoder.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureListsView()
    }
    
    private func configureListsView() {
        lists.register(UINib(nibName: String(describing: UpdateSquadTableViewCell.self), bundle: nil), forCellReuseIdentifier: UpdateSquadTableViewCell.reuseIdentifier)
        lists.separatorStyle = .none
        lists.dataSource = self
        lists.delegate = self
    }

}


extension UpdateSquadController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UpdateSquadTableViewCell.reuseIdentifier, for: indexPath) as! UpdateSquadTableViewCell
        cell.render(vm.lists[indexPath.row])
        return cell
    }
}


extension UpdateSquadController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
