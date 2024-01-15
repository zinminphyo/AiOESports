//
//  CommentListsViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/01/2024.
//

import Foundation
import Combine


class CommentListsViewModel {
    
    enum CommentFilter: String, CaseIterable {
        case all = "All"
        case fiveStars = "5 Stars"
        case fourStars = "4 Stars"
        case threeStars = "3 Stars"
        case twoStars = "2 Stars"
        case oneStar = "1 Star"
    }
    
    private(set) var filterLists: [CommentFilter] = CommentFilter.allCases
    
    @Published
    var selectedIndex: Int = 0
    
    init() {}
    
}
