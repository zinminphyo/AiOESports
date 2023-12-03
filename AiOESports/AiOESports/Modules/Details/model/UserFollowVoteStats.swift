//
//  UserFollowVoteStats.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/12/2023.
//

import Foundation

/*
 {
 "following": false,
 "voting": false,
 "userId": 1026,
 "vote_limit": true
 }
 */
struct UserFollowVoteStats: Decodable {
    let following: Bool
    let voting: Bool
    let userId: Int
    let vote_limit: Bool
}
