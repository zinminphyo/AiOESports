//
//  PrivacyPolicyController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit
import WebKit

class PrivacyPolicyController: UIViewController {
    
    @IBOutlet private(set) var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let request = URLRequest(url: URL(string: "https://aioesports.com/privacy")!)
        webView.load(request)
    }
    

    @IBAction
    private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}
