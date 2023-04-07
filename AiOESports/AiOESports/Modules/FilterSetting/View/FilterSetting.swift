//
//  FilterSetting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/04/2023.
//

import UIKit

class FilterSetting: UIViewController {
    
    @IBOutlet weak var filterSettingTableView: UITableView!
    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var filterSettingTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var filterTopView: UIView!
    @IBOutlet weak var filterTitleLabel: UILabel!
    
    var presenter: FilterSettingPresenting?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureBackgroundView()
        configureContentContainerView()
        configureFilterTopView()
        configureFilterSettingTableView()
        configureFilterSettingTableView()
    }
    
    private func configureBackgroundView() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapDismissView))
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
    }
    
    private func configureContentContainerView() {
        contentContainerView.clipsToBounds = true
        contentContainerView.backgroundColor = Colors.Theme.inputColor
        contentContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contentContainerView.layer.cornerRadius = 20
    }
    
    private func configureFilterTopView() {
        filterTopView.backgroundColor = Colors.Theme.inputColor
        filterTitleLabel.text = "Filter"
        filterTitleLabel.font = Fonts.titleFont
        filterTitleLabel.textColor = Colors.Text.primaryText
    }
    
    private func configureFilterSettingTableView() {
        filterSettingTableView.register(UINib(nibName: String(describing: FilterSettingTableViewCell.self), bundle: nil), forCellReuseIdentifier: FilterSettingTableViewCell.reuseIdentifier)
        filterSettingTableView.separatorStyle = .none
        filterSettingTableView.dataSource = self
        filterSettingTableView.delegate = self
        filterSettingTableView.isScrollEnabled = false
        filterSettingTableViewHeight.constant = FilterSettingTableViewCell.cellHeight * CGFloat(presenter?.getSettingCount() ?? 0)
        filterSettingTableView.allowsMultipleSelection = false
        filterSettingTableView.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .none)
    }
    
    @objc func didTapDismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    

}


// MARK: - Filter Setting View Delegate.
extension FilterSetting: FilterSettingViewDelegate {
    func updateFilterSetting() {
        filterSettingTableView.reloadData()
        filterSettingTableViewHeight.constant = FilterSettingTableViewCell.cellHeight * CGFloat(presenter?.getSettingCount() ?? 0)
        self.view.layoutIfNeeded()
    }
}


// MARK: - UITable View Delegate Conformance
extension FilterSetting: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getSettingCount() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FilterSettingTableViewCell.reuseIdentifier, for: indexPath) as? FilterSettingTableViewCell else {
            return UITableViewCell()
        }
        cell.set(isSelected: indexPath.row == 0)
            .set(settingName: presenter?.getSettingTitle(index: indexPath.row) ?? "")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return FilterSettingTableViewCell.cellHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? FilterSettingTableViewCell else {return}
        cell.set(isSelected: true)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? FilterSettingTableViewCell else {return}
        cell.set(isSelected: false)
    }
}


// MARK: - UIGesture Recognizer Delegate
extension FilterSetting: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view?.isDescendant(of: filterSettingTableView) ?? true == false
    }
}
