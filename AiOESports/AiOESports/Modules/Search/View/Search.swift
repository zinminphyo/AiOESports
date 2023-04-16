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
    
    var presenter: SearchPresenting?
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
        let placeHolder = "Enter PLAYER Name"
        let attributedPlaceHolder = NSMutableAttributedString(string: placeHolder)
        attributedPlaceHolder.addAttribute(.foregroundColor, value: Colors.Text.primaryText!, range: NSRange(location: 0, length: placeHolder.count))
        searchInputTxtField.attributedPlaceholder = attributedPlaceHolder
        
        let searchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        searchButton.addTarget(self, action: #selector(didTapSearchBtn), for: .touchUpInside)
        searchButton.backgroundColor = UIColor.clear
        searchButton.setImage(Images.RankModuleImages.searchlogo, for: .normal)
        searchButton.tintColor = UIColor.white
        searchInputTxtField.textColor = Colors.Text.primaryText
        searchInputTxtField.rightView = searchButton
        searchInputTxtField.rightViewMode = .always
        searchInputTxtField.addTarget(self, action: #selector(didChangeKeyword), for: .editingChanged)
    }
    
    private func configureTableView() {
        resultTableView.register(UINib(nibName: String(describing: SearchTableViewCell.self), bundle: nil), forCellReuseIdentifier: SearchTableViewCell.reuseIdentifier)
        resultTableView.dataSource = self
        resultTableView.estimatedRowHeight = UITableView.automaticDimension
        resultTableView.backgroundColor = UIColor.clear
        resultTableView.keyboardDismissMode = .onDrag
    }
    
    @objc func didTapSearchBtn() {
        print("Search Button Clicked.")
    }
    
    @objc func didTapBackBtn() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func didChangeKeyword() {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(fetchSearchingApi), object: nil)
        perform(#selector(fetchSearchingApi), with: nil, afterDelay: 1)
    }

    @objc func fetchSearchingApi() {
//        presenter?.searchTeamLists(keyword: searchInputTxtField.text ?? "")
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
