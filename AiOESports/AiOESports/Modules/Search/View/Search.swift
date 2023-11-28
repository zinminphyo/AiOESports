//
//  Search.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/04/2023.
//

import UIKit

class Search: UIViewController {
    
    @IBOutlet weak var searchInputTxtField: UITextField!
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet private(set) var loadingView: LoadingView!
    @IBOutlet private(set) var searchLabel: UILabel!
    @IBOutlet private(set) var searchBtn: UIButton!
    
    var presenter: SearchPresenter?
    private var teamLists: [TeamSearchResultModel] = []
    private var playerLists: [PlayerSearchResultModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureBackButton()
        configureSearchInputTextField()
        configureTableView()
    }
    
    private func configureBackButton() {
        backBtn.addTarget(self, action: #selector(didTapBackBtn), for: .touchUpInside)
    }
    
    private func configureSearchInputTextField() {
       
    }
    
    private func configureTableView() {
        resultTableView.register(UINib(nibName: String(describing: SearchTableViewCell.self), bundle: nil), forCellReuseIdentifier: SearchTableViewCell.reuseIdentifier)
        resultTableView.dataSource = self
        resultTableView.delegate = self
        resultTableView.estimatedRowHeight = UITableView.automaticDimension
        resultTableView.backgroundColor = UIColor.clear
        resultTableView.keyboardDismissMode = .onDrag
    }
   
    
    @objc func didTapBackBtn() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction
    private func didChangeKeyword() {
        let isEmpty = searchInputTxtField.text?.isEmpty ?? true
        print("Is Empty is \(isEmpty)")
        searchLabel.isHidden = !isEmpty
        searchBtn.isHidden = isEmpty
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(fetchSearchingApi), object: nil)
        perform(#selector(fetchSearchingApi), with: nil, afterDelay: 1)
    }

    @objc func fetchSearchingApi() {
        presenter?.searchLists(keyword: searchInputTxtField.text ?? "")
    }
    
}

extension Search: SearchViewDelegate {
    func renderTeamLists(teamLists: [TeamSearchResultModel]) {
        self.teamLists = teamLists
        self.resultTableView.reloadData()
    }
    func renderError(error: String) {
        
    }
    
    func renderPlayerLists(playerLists: [PlayerSearchResultModel]) {
        self.playerLists = playerLists
        self.resultTableView.reloadData()
    }
    
    func showLoading() {
        loadingView.showLoading()
    }
    
    func hideLoading() {
        loadingView.hideLoading()
    }
}

extension Search: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch presenter?.getRankCategory() {
        case .team:
            return teamLists.count
        case .player:
            return playerLists.count
        case .caster:
            return playerLists.count
        case .creator:
            return playerLists.count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        switch presenter?.getRankCategory() {
        case .team:
            cell.set(forTeam: teamLists[indexPath.row])
        case .player:
            cell.set(forPlayer: playerLists[indexPath.row])
        case .caster:
            cell.set(forPlayer: playerLists[indexPath.row])
        case .creator:
            cell.set(forPlayer: playerLists[indexPath.row])
        default:
            break
        }
        return cell
    }
}


extension Search: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let category = presenter?.selectedCategory else {
            return
        }
        let id: Int
        switch category {
        case .team:
            id = teamLists[indexPath.row].id
        default:
            id = playerLists[indexPath.row].id
        }
        guard let vc = DetailsModuel.createModule(category: category, id: id) else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}
