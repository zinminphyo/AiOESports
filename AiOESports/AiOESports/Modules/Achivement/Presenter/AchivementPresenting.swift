//
//  AchivementPresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import Foundation
import UIKit


protocol AchivementPresenting {
    var viewDelegate: AchivementViewDelegate? { get set }
    func viewDidLoad()
}
