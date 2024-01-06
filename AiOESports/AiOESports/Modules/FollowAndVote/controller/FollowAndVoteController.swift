//
//  FollowAndVoteController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit
import Combine

class FollowAndVoteController: UIViewController {
    
    @IBOutlet private(set) var tableView: UITableView!
    @IBOutlet private(set) var loadinView: LoadingView!
    
    private let viewModel: FollowAndVoteViewModel!
    private(set) var subscription = Set<AnyCancellable>()
    
    init() {
        viewModel = FollowAndVoteViewModel()
        super.init(nibName: "FollowAndVoteController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support for this NSCoder.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }
    
    
    private func configureHierarchy() {
        configureTableView()
        configureViewModel()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: String(describing: FollowAndVoteCell.self), bundle: nil), forCellReuseIdentifier: FollowAndVoteCell.reuseIdentifier)
        tableView.separatorStyle = .none
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        } else {
            // Fallback on earlier versions
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configureViewModel() {
        
        viewModel.fetchingStatus
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                let isFetching = $0 == .isFetching
                isFetching ? self.loadinView.showLoading() : self.loadinView.hideLoading()
            }.store(in: &subscription)
        
        viewModel.$followedTeamList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
            }.store(in: &subscription)
        
        viewModel.$followedPlayerList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.tableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .fade)
            }.store(in: &subscription)
        
        viewModel.$followedCasterList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.tableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: .fade)
            }.store(in: &subscription)
        
        viewModel.$followedCreatorList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.tableView.reloadRows(at: [IndexPath(row: 3, section: 0)], with: .fade)
            }.store(in: &subscription)
        
        viewModel.$votedTeamList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.tableView.reloadRows(at: [IndexPath(row: 0, section: 1)], with: .fade)
            }.store(in: &subscription)
        
        viewModel.$votedPlayerList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.tableView.reloadRows(at: [IndexPath(row: 1, section: 1)], with: .fade)
            }.store(in: &subscription)
        
        viewModel.$votedCasterList
            .receive(on: DispatchQueue.main)
            .sink { [weak self]  _ in
                guard let self = self else { return }
                self.tableView.reloadRows(at: [IndexPath(row: 2, section: 1)], with: .fade)
            }.store(in: &subscription)
        
        viewModel.$votedCreatorList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.tableView.reloadRows(at: [IndexPath(row: 3, section: 1)], with: .fade)
            }.store(in: &subscription)
        
        viewModel.fetchFollowAndVoteList()
        
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        handleCellRenderer(for: tableView, indexPath: indexPath)
    }
    
    private func handleCellRenderer(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FollowAndVoteCell.reuseIdentifier, for: indexPath) as! FollowAndVoteCell
        let section = indexPath.section
        let row = indexPath.row
        if section == 0 {
            switch row {
            case 0:
                cell.render(title: "Following Teams")
                cell.render(list: viewModel.followedTeamList)
            case 1:
                cell.render(title: "Following Players")
                cell.render(talentLists: viewModel.followedPlayerList)
            case 2:
                cell.render(title: "Following Casters")
                cell.render(talentLists: viewModel.followedCasterList)
            case 3:
                cell.render(title: "Following Creators")
                cell.render(talentLists: viewModel.followedCreatorList)
            default:
                break
            }
        } else {
            switch row {
            case 0:
                cell.render(title: "Voted Teams")
                cell.render(list: viewModel.votedTeamList)
            case 1:
                cell.render(title: "Voted Players")
                cell.render(talentLists: viewModel.votedPlayerList)
            case 2:
                cell.render(title: "Voted Casters")
                cell.render(talentLists: viewModel.votedCasterList)
            case 3:
                cell.render(title: "Voted Creators")
                cell.render(talentLists: viewModel.votedCreatorList)
            default:
                break
            }
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type: FollowAndVoteListsViewModel.FollowAndVoteType
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                type = .followTeam
            case 1:
                type = .followPlayer
            case 2:
                type = .followCaster
            case 3:
                type = .followCreator
            default:
                type = .followCaster
            }
        } else {
            switch indexPath.row {
            case 0:
                type = .voteTeam
            case 1:
                type = .votePlayer
            case 2:
                type = .voteCaster
            case 3:
                type = .voteCreator
            default:
                type = .followCaster
            }
        }
        let models: [FollowAndVoteListsViewModel.FollowAndVoteModel]
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                models = viewModel.followedTeamList.compactMap{ .init(id: String($0.id), name: $0.team_name, imageURL: $0.team_image) }
            case 1:
                models = viewModel.followedPlayerList.compactMap{ .init(id: String($0.id), name: $0.name, imageURL: $0.player_image) }
            case 2:
                models = viewModel.followedCasterList.compactMap{ .init(id: String($0.id), name: $0.name, imageURL: $0.player_image) }
            case 3:
                models = viewModel.followedCreatorList.compactMap{ .init(id: String($0.id), name: $0.name, imageURL: $0.player_image) }
            default:
                models = []
            }
        } else {
            
            switch indexPath.row {
            case 0:
                models = viewModel.votedTeamList.compactMap{ .init(id: String($0.id), name: $0.team_name, imageURL: $0.team_image) }
            case 1:
                models = viewModel.votedPlayerList.compactMap{ .init(id: String($0.id), name: $0.name, imageURL: $0.player_image) }
            case 2:
                models = viewModel.votedCasterList.compactMap{ .init(id: String($0.id), name: $0.name, imageURL: $0.player_image) }
            case 3:
                models = viewModel.votedCreatorList.compactMap{ .init(id: String($0.id), name: $0.name, imageURL: $0.player_image) }
            default:
                models = []
            }
        
        }
            
        
        let vc = FollowAndVoteListsController(lists: models, type: type)
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
