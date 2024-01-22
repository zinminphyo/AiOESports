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
    
    @Published
    var filterLists: [CommentFilter] = []
    
    private var allRatingLists: RatingLists = []
    
    @Published
    var filterRatingLists: RatingLists = []
    
    @Published
    var selectedIndex: Int = 0 {
        didSet {
            filter()
        }
    }
    
    private let service = GetDetailsService()
    private let id: String
    private let category: RankCategory
    
    init(id: String, category: RankCategory) {
        self.id = id
        self.category = category
    }
    
    func fetchRatingLists() {
        switch category {
        case .team:
            fetchTeamRatingLists()
        case .player:
            fetchPlayerRatingLists()
        case .caster:
            fetchCasterRatingLists()
        case .creator:
            fetchCreatorRatingLists()
        }
    }
    
    private func fetchTeamRatingLists() {
        Task {
            do {
                let response = try await service.fetchTeamDetails(id: id)
                allRatingLists = response.ratingLists
                filterFilterLists()
                filter()
            } catch {
                print("Error is \(error.localizedDescription)")
            }
        }
    }
    
    private func fetchPlayerRatingLists() {
        Task {
            do {
                let response = try await service.fetchPlayerDetails(id: id)
                allRatingLists = response.ratingLists
                filterFilterLists()
                filter()
            } catch {
                print("Error is \(error.localizedDescription)")
            }
        }
    }
    
    private func fetchCasterRatingLists() {
        Task {
            do {
                let response = try await service.fetchCasterDetails(id: id)
                allRatingLists = response.ratingLists
                filterFilterLists()
                filter()
            } catch {
                print("Error is \(error.localizedDescription)")
            }
        }
    }
    
    private func fetchCreatorRatingLists() {
        Task {
            do {
                let response = try await service.fetchCreatorDetails(id: id)
                allRatingLists = response.ratingLists
                filterFilterLists()
                filter()
            } catch {
                print("Error is \(error.localizedDescription)")
            }
        }
    }
    
    private func filterFilterLists() {
        filterLists.append(.all)
        if allRatingLists.filter({ $0.star == 5 }).isEmpty == false { filterLists.append(.fiveStars) }
        if allRatingLists.filter({ $0.star == 4 }).isEmpty == false { filterLists.append(.fourStars) }
        if !allRatingLists.filter({ $0.star == 3 }).isEmpty { filterLists.append(.threeStars) }
        if !allRatingLists.filter({ $0.star == 2 }).isEmpty { filterLists.append(.twoStars) }
        if !allRatingLists.filter({ $0.star == 1 }).isEmpty { filterLists.append(.oneStar) }
    }
    
    private func filter() {
        let filterType = filterLists[selectedIndex]
        switch filterType {
        case .all:
            filterRatingLists = allRatingLists
        case .fiveStars:
            filterRatingLists = allRatingLists.filter{ $0.star == 5 }
        case .fourStars:
            filterRatingLists = allRatingLists.filter{ $0.star == 4 }
        case .threeStars:
            filterRatingLists = allRatingLists.filter{ $0.star == 3 }
        case .twoStars:
            filterRatingLists = allRatingLists.filter{ $0.star == 2 }
        case .oneStar:
            filterRatingLists = allRatingLists.filter{ $0.star == 1 }
        }
         
    }
    
}
