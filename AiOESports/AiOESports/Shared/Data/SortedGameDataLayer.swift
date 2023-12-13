//
//  SortedGameDataLayer.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/12/2023.
//

import Foundation



class SortedGameDataLayer {
    
    let defaults = UserDefaults.standard
    
    private let key = "SortedGameData"
    
    private init() {}
    
    static let shared = SortedGameDataLayer()
    
    func save(data: GameSortedData) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(data) {
            defaults.set(encoded, forKey: key)
        }
    }
    
    func getData() -> GameSortedData {
        if let data = defaults.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let sortedGames = try? decoder.decode(GameSortedData.self, from: data) {
                return sortedGames
            }
            return GameSortedData(sortedGames: SortableGames.allCases.compactMap{ .init(gameType: $0) })
        } else {
            return GameSortedData(sortedGames: SortableGames.allCases.compactMap{ .init(gameType: $0) })
        }
        
    }
    
}
