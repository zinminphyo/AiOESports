//
//  VoteController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 29/11/2023.
//

import UIKit
import Combine

class VoteController: UIViewController {
    
    @IBOutlet private(set) var editBtn: UIButton!
    @IBOutlet private(set) var continueBtn: UIButton!
    @IBOutlet private(set) var contentScrollView: UIScrollView!
    @IBOutlet private(set) var actionButtonBottomConstraint: NSLayoutConstraint!
    
    private let viewModel: VoteViewModel!
    
    private(set) var subscription = Set<AnyCancellable>()
    
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
        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureKeyboardNotification()
        configureScrollView()
    }
    
    private func configureScrollView() {
//        contentScrollView.keyboardDismissMode = .onDragWithAccessory
    }
    
    private func configureKeyboardNotification() {
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .receive(on: DispatchQueue.main)
            .map{ ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.size.height }
            .sink { [weak self] keyboardHeight in
                guard let self = self else { return }
                guard let height = keyboardHeight else { return }
                UIView.animate(withDuration: 0.5) {
                    let y = self.contentScrollView.contentSize.height - height
                    self.contentScrollView.setContentOffset(CGPoint(x: 0, y: y), animated: true)
                    self.actionButtonBottomConstraint.constant = height
                }
            }.store(in: &subscription)
        
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                UIView.animate(withDuration: 0.5) {
                    self.contentScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
                    self.actionButtonBottomConstraint.constant = 24
                }
            }.store(in: &subscription)
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
