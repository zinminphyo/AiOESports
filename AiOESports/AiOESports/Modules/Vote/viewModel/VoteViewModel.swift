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
    
    
    let voteInfo: VoteInfo
    
    struct VoteInfo {
        let imageURL: String
        let name: String
        let game: String
        let rank: String
        let location: String
        let totalRatingStar: String
        let coverImageURL: String
        let id: String
        let type: VotingType
        enum VotingType {
            case team
            case talent
        }
    }
    
    @Published
    var commentStatus: CommentStatus = .input
    enum CommentStatus {
        case input
        case preview
        case submit
    }
    
    init(userid: Int, voteInfo: VoteInfo) {
        userId = String(userid)
        self.voteInfo = voteInfo
    }
    
}
