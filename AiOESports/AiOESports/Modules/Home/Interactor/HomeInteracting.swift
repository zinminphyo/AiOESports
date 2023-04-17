//
//  HomeInteracting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 17/04/2023.
//

import Foundation


protocol HomeInteracting {
    var presenterDelegate: HomePresenting? { get set }
    func fetchHomeData()
}
