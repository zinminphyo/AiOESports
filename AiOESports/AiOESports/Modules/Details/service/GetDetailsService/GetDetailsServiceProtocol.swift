//
//  GetDetailsServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/12/2023.
//

import Foundation

/*
 {
     "result": {
         "data": {
             "UserFollowVoteStats": {
                 "following": false,
                 "voting": false,
                 "userId": 1026,
                 "vote_limit": true
             },
             "TotalFollowRating": {
                 "teamRank": 30,
                 "totalFollowers": null,
                 "totalRating": 1,
                 "totalRatingStars": "5"
             },
             "stats": {
                 "detail": {
                     "id": 30,
                     "team_name": "IMPUNITY MM",
                     "status": "disbanded",
                     "founded_date": null,
                     "full_name": "Impunity Myanmar",
                     "location": "images/flag/mm.png",
                     "city": "Yangon",
                     "owner": null,
                     "manager": null,
                     "bio": null,
                     "game": "mlbb",
                     "role": "-",
                     "team_image": "images/game/mlbb/Team/impunity_profile.png",
                     "cover_image": null,
                     "sort_no": "1",
                     "visable": "1",
                     "total_follower": 0,
                     "total_rate_user": 1,
                     "total_rate_star": 5,
                     "created_at": "2022-10-23T00:24:17.000000Z",
                     "updated_at": "2023-10-03T16:32:46.000000Z"
                 },
                 "social": [
                     {
                         "id": 42,
                         "player_id": "-",
                         "team_id": "30",
                         "tour_id": "-",
                         "platform": "facebook_page",
                         "link": "475267193301046",
                         "sort_no": 0,
                         "created_at": "2022-10-11T16:18:10.000000Z",
                         "updated_at": "2022-10-11T16:18:10.000000Z"
                     }
                 ]
             },
             "player": null,
             "former_player": null,
             "sponsor": null,
             "achieve": [
                 {
                     "tour_name": "MPL MYANMAR Season 4",
                     "tour_logo": "images/game/mlbb/Tour/mpl1234.png",
                     "tier": "B-Tier",
                     "place": "7th Place",
                     "sort_no": 9
                 }
             ],
             "shield_support": {
                 "month": [],
                 "today": [],
                 "lifetime": []
             },
             "rating_list": [
                 {
                     "star": 5,
                     "comment": "🫶🏻",
                     "created_at": "2023-10-03T16:32:46.000000Z",
                     "username": "yuzhan",
                     "profile_image": "images/profileImages/default.png",
                     "id": 731,
                     "level": "free",
                     "badge": "off"
                 }
             ]
         }
     },
     "statusCode": 200,
     "message": "Success"
 }
 */

protocol GetDetailsServiceProtocol {
    func fetchTeamDetails(id: String) async throws -> TeamDetails
    func fetchPlayerDetails(id: String) async throws -> PlayerDetails
    func fetchCasterDetails(id: String) async throws -> CasterDetails
    func fetchCreatorDetails(id: String) async throws -> CasterDetails
}
