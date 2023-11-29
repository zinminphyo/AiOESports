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
    @IBOutlet private(set) var commentView: CommentView!
    @IBOutlet private(set) var commnetPreview: CommentPreview!
    
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
        configureViewModel()
        configureKeyboardNotification()
    }

    private func configureViewModel() {
        viewModel.$commentStatus
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.commentView.isHidden = $0 != .input
                self.commnetPreview.isHidden = $0 != .preview
            }.store(in: &subscription)
        
        viewModel.$commentStatus
            .receive(on: DispatchQueue.main)
            .sink { [weak self] status in
                guard let self = self else {return }
                UIView.animate(withDuration: 0.3) {
                    self.editBtn.isHidden = status != .preview
                }
            }.store(in: &subscription)
    }
    
    private func configureKeyboardNotification() {
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .receive(on: DispatchQueue.main)
            .map{ ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.size.height }
            .sink { [weak self] keyboardHeight in
                guard let self = self else { return }
                guard let height = keyboardHeight else { return }
                let y = self.contentScrollView.contentSize.height - height - 50
                self.contentScrollView.setContentOffset(CGPoint(x: 0, y: y), animated: true)
                self.actionButtonBottomConstraint.constant = height
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
            }.store(in: &subscription)
        
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.contentScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
                self.actionButtonBottomConstraint.constant = 24
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
            }.store(in: &subscription)
    }
    
    
    
    @IBAction
    private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
   
    @IBAction
    private func didTapContinue(_ sender: UIButton) {
        commnetPreview.set(comment: commentView.comment)
        viewModel.commentStatus = .preview
    }

    @IBAction
    private func didTapEdit(_ sender: UIButton) {
        viewModel.commentStatus = .input
    }
}
