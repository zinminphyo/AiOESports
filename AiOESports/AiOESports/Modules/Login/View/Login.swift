//
//  Login.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/03/2023.
//

import UIKit

class Login: UIViewController {
    
    @IBOutlet weak var pinView: PinView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pinView.delegate = self
    }
    

    

}


extension Login: PinViewDelegate {
    func didFinishedConfirmCode(isMatched: Bool) {
        print("IsMatched Flag => \(isMatched)")
    }
    func didFinishedEnterCode() {
        print("Enter Code.")
    }
}
