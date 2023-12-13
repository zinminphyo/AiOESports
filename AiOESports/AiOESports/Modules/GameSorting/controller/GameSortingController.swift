//
//  GameSortingController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit

class GameSortingController: UIViewController {
    
    @IBOutlet private(set) var tableView: UITableView!
    var sortedGames: [GameSortedData.Sorting] = SortedGameDataLayer.shared.getData().sortedGames

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: String(describing: GameSortingCategoryCell.self), bundle: nil), forCellReuseIdentifier: GameSortingCategoryCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.dragDelegate = self
        tableView.separatorStyle = .none
    }
    
    
    @IBAction
    private func didTapBack(_ sender: UIButton) {
        SortedGameDataLayer.shared.save(data: GameSortedData(sortedGames: sortedGames))
        navigationController?.popViewController(animated: true)
    }
    
    

}


extension GameSortingController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GameSortingCategoryCell.reuseIdentifier, for: indexPath) as! GameSortingCategoryCell
        let game = sortedGames[indexPath.row].gameType
        cell.render(gameImage: game.image)
            .render(gameName: game.rawValue)
        return cell
    }
}

extension GameSortingController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let game = sortedGames.remove(at: sourceIndexPath.row)
        sortedGames.insert(game, at: destinationIndexPath.row)
    }
    
}


extension GameSortingController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = indexPath.row
        return [dragItem]
    }
    
    
}

