//
//  VoteController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 29/11/2023.
//

import UIKit

class VoteController: UIViewController {
    
    @IBOutlet private(set) var editBtn: UIButton!
    @IBOutlet private(set) var continueBtn: UIButton!
    
    private let viewModel: VoteViewModel!
    
    init(userId: Int) {
        viewModel = VoteViewModel(userid: userId)
        super.init(nibName: "VoteController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support for this NSCoder")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction
    private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
   
    @IBAction
    private func didTapContinue(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            self.editBtn.isHidden = false
        }
    }

    @IBAction
    private func didTapEdit(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            self.editBtn.isHidden = true
        }
    }
}
