//
//  VoteViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 29/11/2023.
//

import Foundation
import Combine


class VoteViewModel {
    
    private let userId: String
    
    
    @Published
    var commentStatus: CommentStatus = .input
    enum CommentStatus {
        case input
        case preview
        case submit
    }
    
    init(userid: Int) {
        userId = String(userid)
    }
    
}
