//
//  AchivementViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import Foundation


protocol AchivementViewDelegate {
    var presenter: AchivementPresenting? { get set }
    func updateUI(achivement: [AchivementModel])
}
