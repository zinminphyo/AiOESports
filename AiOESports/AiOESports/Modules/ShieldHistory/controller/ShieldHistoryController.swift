//
//  ShieldHistoryController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 19/01/2024.
//

import UIKit
import Combine

class ShieldHistoryController: UIViewController {
    
    @IBOutlet private(set) var historyLists: UITableView!
    @IBOutlet private(set) var historyListsHeight: NSLayoutConstraint!
    @IBOutlet private(set) var contentScrollView: UIScrollView!
    @IBOutlet private(set) var contentContainerView: UIView!
    @IBOutlet private(set) var loadingView: UIView!
    @IBOutlet private(set) var currentShieldAmountLabel: UILabel!
    
    private var histories: ShieldHistories = []
    
    private let vm: ShieldHistoryViewModel!
    private(set) var subscription = Set<AnyCancellable>()
    
    init() {
        vm = ShieldHistoryViewModel()
        super.init(nibName: "ShieldHistoryController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support for this NSCoder.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureScrollView()
        configureShieldLists()
        configureContentContainerView()
        configureViewModel()
    }
    
    
    private func configureScrollView() {
        contentScrollView.contentInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
    }
    
    private func configureContentContainerView() {
        contentContainerView.layer.borderColor = Colors.Text.secondaryText?.cgColor
        contentContainerView.layer.borderWidth = 1
    }
    
    private func configureShieldLists() {
        historyLists.register(UINib(nibName: String(describing: ShieldHistoryCell.self), bundle: nil), forCellReuseIdentifier: ShieldHistoryCell.reuseIdentifier)
        historyLists.separatorStyle = .none
        historyLists.dataSource = self
        historyLists.delegate = self
        historyLists.isScrollEnabled = true
    }
    
    private func configureViewModel() {
        vm.fetchingCompleted
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self  = self else { return }
                self.histories = $0
                self.historyLists.reloadData()
                self.historyListsHeight.constant = ShieldHistoryCell.height * CGFloat($0.count)
                self.view.invalidateIntrinsicContentSize()
            }.store(in: &subscription)
        
        vm.$shieldCount
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.currentShieldAmountLabel.text = String($0)
            }.store(in: &subscription)
        
        vm.$isFetching
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.loadingView.isHidden = !$0
            }.store(in: &subscription)
        
        vm.fetchShieldCount()
        vm.fetchHistories()
    }

    @IBAction
    private func didTapBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}


extension ShieldHistoryController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return histories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShieldHistoryCell.reuseIdentifier, for: indexPath) as! ShieldHistoryCell
        cell.render(histories[indexPath.row])
        return cell
    }
}


extension ShieldHistoryController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ShieldHistoryCell.height
    }
}
