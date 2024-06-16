//
//  RankListHeaderView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 16/06/2024.
//

import UIKit

class RankListHeaderView: UIControl, NibLoadable {

    @IBOutlet private var selectedIndexView: UIView!


    var selectedIndex: Int {
        _selectedIndex
    }
    private var _selectedIndex: Int = 0 {
        didSet {
            guard oldValue != selectedIndex else { return }
            sendActions(for: .valueChanged)
            updateSelectionView()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadedByNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadedByNib()
    }

    private func updateSelectionView() {
        let originX: CGFloat = CGFloat(_selectedIndex) * selectedIndexView.frame.width
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.selectedIndexView.frame.origin.x = originX
        }
    }

    @IBAction
    private func didTapTeam(_ sender: UIButton) {
        _selectedIndex = 0
    }

    @IBAction
    private func didTapPlayer(_ sender: UIButton) {
        _selectedIndex = 1
    }

    @IBAction
    private func didTapCaster(_ sender: UIButton) {
        _selectedIndex = 2
    }

    @IBAction
    private func didTapCreator(_ sender: UIButton) {
        _selectedIndex = 3
    }

}
