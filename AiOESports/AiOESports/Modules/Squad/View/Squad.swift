//
//  Squad.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import UIKit

class Squad: UIViewController {
    
    @IBOutlet weak var squadTableView: UITableView!
    private var squadModel: SquadModel? = nil
    var viewModel: SquadViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
        
        viewModel?.viewDidLoad()
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
        squadTableView.sectionHeaderTopPadding = 10.0
    }

}


extension Squad: SquadViewDelegate {
    func renderView(squad: SquadModel) {
        self.squadModel = squad
        squadTableView.reloadData()
    }
}

extension Squad: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return squadModel?.headCoach == nil ? 0 : 1
        } else if section == 1 {
            return squadModel?.assistantCoach == nil ? 0 : 1
        } else if section == 2 {
            return squadModel?.technicalDirector == nil ? 0 : 1
        } else if section == 3 {
            return squadModel?.analyst == nil ? 0 : 1
        } else {
            return squadModel?.roster.count ?? 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SquadTableViewCell.reuseIdentifier, for: indexPath) as? SquadTableViewCell else { return UITableViewCell() }
        let section = indexPath.section
        guard let model = squadModel else { return UITableViewCell() }
        switch section {
        case 0:
            cell.set(coach: model.headCoach)
        case 1:
            cell.set(coach: model.assistantCoach)
        case 2:
            cell.set(coach: model.technicalDirector)
        case 3:
            cell.set(coach: model.analyst)
        case 4:
            cell.set(roster: model.roster[indexPath.row])
        default:
            break
        }
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
        } else if section == 2 {
            label.text = "Technical Director".uppercased()
        } else if section == 3 {
            label.text = "Analyst".uppercased()
        } else {
            label.text = "Roster".uppercased()
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
        switch section {
        case 0:
            return squadModel?.headCoach == nil ? 0 : 50
        case 1:
            return squadModel?.assistantCoach == nil ? 0 : 50
        case 2:
            return squadModel?.technicalDirector == nil ? 0 : 50
        case 3:
            return squadModel?.analyst == nil ? 0 : 50
        case 4:
            return squadModel?.roster.count == 0 ? 0 : 50
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return squadModel?.headCoach == nil ? 0 : 15
        case 1:
            return squadModel?.assistantCoach == nil ? 0 : 15
        case 2:
            return squadModel?.technicalDirector == nil ? 0 : 15
        case 3:
            return squadModel?.analyst == nil ? 0 : 15
        case 4:
            return squadModel?.roster.count == 0 ? 0 : 15
        default:
            return 0
        }
        return 15
    }
}
