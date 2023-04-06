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
        attributedPlaceHolder.addAttribute(.foregroundColor, value: Colors.Text.primaryText, range: NSRange(location: 0, length: placeHolder.count))
        searchInputTxtField.attributedPlaceholder = attributedPlaceHolder
        
        let searchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        searchButton.addTarget(self, action: #selector(didTapSearchBtn), for: .touchUpInside)
        searchButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 10)
        searchButton.backgroundColor = UIColor.clear
        searchButton.setImage(Images.RankModuleImages.searchlogo, for: .normal)
        searchButton.tintColor = UIColor.white
        searchInputTxtField.rightView = searchButton
        searchInputTxtField.rightViewMode = .always
    }
    
    private func configureTableView() {
        resultTableView.register(UINib(nibName: String(describing: SearchTableViewCell.self), bundle: nil), forCellReuseIdentifier: SearchTableViewCell.reuseIdentifier)
        resultTableView.separatorStyle = .none
        resultTableView.dataSource = self
        resultTableView.estimatedRowHeight = UITableView.automaticDimension
        resultTableView.backgroundColor = UIColor.clear
    }
    
    @objc func didTapSearchBtn() {
        print("Search Button Clicked.")
    }
    
    @objc func didTapBackBtn() {
        self.navigationController?.popViewController(animated: true)
    }

}


extension Search: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        let mockTeamModel = TeamSearchResultModel(teamName: "FALCON", id: 5, teamImage: "images/game/mlbb/Team/falcon_profile.png", game: "mlbb", fullName: "Falcon Esports")
        cell.set(forTeam: mockTeamModel)
        return cell
    }
}
