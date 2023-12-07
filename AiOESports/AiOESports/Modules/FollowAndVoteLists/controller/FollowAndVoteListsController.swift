//
//  FollowAndVoteController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 07/12/2023.
//

import UIKit

class FollowAndVoteListsController: UIViewController {
    
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var listsTblView: UITableView!
    
    private let viewModel: FollowAndVoteListsViewModel
    
    init(lists: [FollowAndVoteListsViewModel.FollowAndVoteModel], type: FollowAndVoteListsViewModel.FollowAndVoteType) {
        viewModel = FollowAndVoteListsViewModel(lists: lists, type: type)
        super.init(nibName: "FollowAndVoteListsController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        UIBinding()
        configureTableView()
    }
    
    private func configureTableView() {
        listsTblView.register(UINib(nibName: String(describing: FollowAndVoteListCell.self), bundle: nil), forCellReuseIdentifier: FollowAndVoteListCell.reuseIdentifier)
        listsTblView.dataSource = self
        listsTblView.delegate = self
        listsTblView.separatorStyle = .none
    }
    
    private func UIBinding() {
        titleLabel.text = viewModel.type.title
    }
    
    
    @IBAction
    private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
 
}



extension FollowAndVoteListsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  FollowAndVoteListCell.reuseIdentifier, for: indexPath) as! FollowAndVoteListCell
        cell.render(model: viewModel.lists[indexPath.row])
        return cell
    }
}


extension FollowAndVoteListsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category: RankCategory
        switch viewModel.type {
        case .followTeam, .voteTeam:
            category = .team
        case .followPlayer, .votePlayer:
            category = .player
        case .followCaster, .voteCaster:
            category = .caster
        case .followCreator, .voteCreator:
            category = .creator
        }
        guard let id = Int(viewModel.lists[indexPath.row].id) else { return }
        guard let vc = DetailsModuel.createModule(category: category, id: id) else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}
