//
//  GameSortedData.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/12/2023.
//

import Foundation


struct GameSortedData: Codable {
    
    let sortedGames: [Sorting]
    
    struct Sorting: Codable {
        let gameType: SortableGames
    }
    
    
}
