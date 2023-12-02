//
//  VoteController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 29/11/2023.
//

import UIKit
import Combine
import Kingfisher

class VoteController: UIViewController {
    
    
    @IBOutlet private(set) var coverImageView: UIImageView!
    @IBOutlet private(set) var teamImageView: UIImageView!
    @IBOutlet private(set) var teamNameLabel: UILabel!
    @IBOutlet private(set) var gameImageView: UIImageView!
    @IBOutlet private(set) var locationLabel: UILabel!
    @IBOutlet private(set) var rankLabel: UILabel!
    @IBOutlet private(set) var totalRatingStarLabel: UILabel!
    @IBOutlet private(set) var editBtn: UIButton!
    @IBOutlet private(set) var continueBtn: UIButton!
    @IBOutlet private(set) var contentScrollView: UIScrollView!
    @IBOutlet private(set) var actionButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet private(set) var commentView: CommentView!
    @IBOutlet private(set) var commnetPreview: CommentPreview!
    @IBOutlet private(set) var thankYouView: ThankYouView!
    
    private let viewModel: VoteViewModel!
    
    private(set) var subscription = Set<AnyCancellable>()
    
    init(userId: Int, voteInfo: VoteViewModel.VoteInfo) {
        viewModel = VoteViewModel(userid: userId, voteInfo: voteInfo)
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
        configureKeyboardDismiss()
        configureViewModel()
        bindUI()
        configureKeyboardNotification()
    }
    
    private func configureKeyboardDismiss() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapViewToDismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func didTapViewToDismissKeyboard() {
        view.endEditing(true)
    }
    
    private func bindUI() {
        coverImageView.kf.setImage(with: URL(string: viewModel.voteInfo.coverImageURL))
        teamImageView.kf.setImage(with: URL(string: viewModel.voteInfo.imageURL))
        teamNameLabel.text = viewModel.voteInfo.name
        gameImageView.image = Images.gameLogo(gameType: viewModel.voteInfo.game)
        locationLabel.text = viewModel.voteInfo.location
        rankLabel.text = viewModel.voteInfo.rank
        totalRatingStarLabel.text = viewModel.voteInfo.totalRatingStar
    }

    private func configureViewModel() {
        viewModel.$commentStatus
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.commentView.isHidden = $0 != .input
                self.commnetPreview.isHidden = $0 != .preview
                self.thankYouView.isHidden = $0 != .submit
            }.store(in: &subscription)
        
        viewModel.$commentStatus
            .receive(on: DispatchQueue.main)
            .sink { [weak self] status in
                guard let self = self else {return }
                UIView.animate(withDuration: 0.3) {
                    self.continueBtn.isHidden = status == .submit
                    self.editBtn.isHidden = status == .input
                }
            }.store(in: &subscription)
        
        viewModel.$commentStatus
            .receive(on: DispatchQueue.main)
            .map{ $0 == .preview ? "Edit" : "Exit" }
            .sink { [weak self] title in
                guard let self = self else { return }
                UIView.animate(withDuration: 0.3, delay: 0.0, options: [.transitionCrossDissolve], animations: {
                    self.editBtn.setTitle(title, for: .normal)
                }, completion: nil)
            }.store(in: &subscription)
        
        viewModel.$commentStatus
            .receive(on: DispatchQueue.main)
            .map{ $0 == .input ? "Continue" : "Submit" }
            .sink { [weak self] title in
                guard let self = self else { return }
                UIView.animate(withDuration: 0.3) {
                    self.continueBtn.setTitle(title, for: .normal)
                }
            }.store(in: &subscription)
        
        viewModel.$userInfo
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                guard let userInfo = $0 else { return }
                self.commnetPreview.set(url: userInfo.profile_image)
                    .set(name: userInfo.username)
            }.store(in: &subscription)
        
        viewModel.fetchUserData()
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
        viewModel.commentStatus = viewModel.commentStatus == .preview ? .submit : .preview
    }

    @IBAction
    private func didTapEdit(_ sender: UIButton) {
        viewModel.commentStatus = .input
    }
}
