//
//  Squad.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import UIKit

class Squad: UIViewController {
    
    @IBOutlet weak var squadTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
    }
    

    private func configureHierarchy() {
        configureContainerView()
        configureTableView()
    }
    
    private func configureContainerView() {
        self.view.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureTableView() {
        squadTableView.register(UINib(nibName: String(describing: SquadTableViewCell.self), bundle: nil), forCellReuseIdentifier: SquadTableViewCell.reuseIdentifier)
        squadTableView.dataSource = self
        squadTableView.delegate = self
        squadTableView.separatorStyle = .none
        squadTableView.showsVerticalScrollIndicator = false
        squadTableView.showsHorizontalScrollIndicator = false
    }

}

extension Squad: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 2 ? 10 : 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SquadTableViewCell.reuseIdentifier, for: indexPath) as? SquadTableViewCell else { return UITableViewCell() }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SquadTableViewCell.cellHeight
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: squadTableView.frame.width, height: 60))
        let label = UILabel(frame: .zero)
        view.addSubview(label)
        label.font = Fonts.subtitleFont
        label.textColor = Colors.Text.primaryText
        if section == 0 {
            label.text = "Head Coach".uppercased()
        } else if section == 1 {
            label.text = "Assistant Coach".uppercased()
        } else {
            label.text = "Rosters".uppercased()
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ])
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 10
        view.backgroundColor = Colors.Theme.inputColor
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: squadTableView.frame.width, height: 10))
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.layer.cornerRadius = 10
        view.backgroundColor = Colors.Theme.inputColor
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}
