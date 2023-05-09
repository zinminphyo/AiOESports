//
//  VerifyPhone.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 09/05/2023.
//

import UIKit
import Combine

class VerifyPhone: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var pinView: PinView!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var verifyBtn: UIButton!
    
    private var timer: Timer? = nil
    var totalSeconds: Int = 300
    
    
    private var enterPINPublisher: CurrentValueSubject<Bool,Never> = .init(false)
    
    private var cancellable = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureBackButton()
        configurePinView()
        configureRemainingLabel()
        configureVerifyButton()
    }
    
    private func configureBackButton() {
        backBtn.addTarget(self, action: #selector(didTapBackBtn), for: .touchUpInside)
    }
    
    private func configurePinView() {
        pinView.digitStyle = .sixDigits
        pinView.state = .enter
        pinView.delegate = self
    }
    
    private func configureRemainingLabel() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        timer?.fire()
    }
    
    private func configureVerifyButton() {
        
        enterPINPublisher
            .assign(to: \.isUserInteractionEnabled, on: verifyBtn)
            .store(in: &cancellable)
        
        enterPINPublisher
            .sink { flag in
                self.verifyBtn.backgroundColor = flag ? Colors.Button.primaryColor : Colors.Button.primaryColor?.withAlphaComponent(0.4)
            }.store(in: &cancellable)
        
        verifyBtn.addTarget(self, action: #selector(didTapVerifyBtn), for: .touchUpInside)
    }

    @objc func didTapBackBtn() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func updateTimer() {
        if totalSeconds == 0 {
            timer?.invalidate()
        } else {
            let mins = totalSeconds / 60
            let secs = totalSeconds % 60
            remainingTimeLabel.text = String(format: "%02i:%02i", mins,secs)
            totalSeconds -= 1
        }
    }
    
    @objc func didTapVerifyBtn() {
        print("Verify")
    }
}

// MARK: - PinView Delegate.
extension VerifyPhone: PinViewDelegate {
    func didFinishedEnterCode(password: String) {
        enterPINPublisher.send(password.count == 6)
    }
    
    func didFinishedConfirmCode(isMatched: Bool) {
        print("Is Matched is \(isMatched)")
    }
    
    
}
