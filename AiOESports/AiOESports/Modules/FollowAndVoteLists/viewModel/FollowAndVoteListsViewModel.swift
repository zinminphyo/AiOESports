//
//  FollowAndVoteListsViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 07/12/2023.
//

import Foundation


class FollowAndVoteListsViewModel {
    
    struct FollowAndVoteModel {
        let id: String
        let name: String
        let imageURL: String
    }
    
    enum FollowAndVoteType {
        case followTeam 
        case followPlayer
        case followCaster
        case followCreator
        
        case voteTeam
        case votePlayer
        case voteCaster
        case voteCreator
        
        var title: String {
            switch self {
            case .followTeam:
                return "Following Teams"
            case .followPlayer:
                return "Following Players"
            case .followCaster:
                return "Following Casters"
            case .followCreator:
                return "Following Creators"
            case .voteTeam:
                return "Voted Teams"
            case .votePlayer:
                return "Voted Players"
            case .voteCaster:
                return "Voted Casters"
            case .voteCreator:
                return "Voted Creators"
            }
        }
    }
    
    let type: FollowAndVoteType
    let lists: [FollowAndVoteModel]
    
    init(lists: [FollowAndVoteModel], type: FollowAndVoteType) {
        self.lists = lists
        self.type = type
    }
    
}
