//
//  RankPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/04/2023.
//

import Foundation


class RankPresenter: RankPresenting {
    
    var router: RankRouting?
    
    func fetchTeamLists() {
        NetworkService.shared.request(router: .fetchTeamLists) { (result: Result<PaginationNetworkResponse<TeamObject>,NetworkError>) in
            switch result {
            case .success(let success):
                print("result is \(success.data)")
            case .failure(let failure):
                print("Error is \(failure.localizedDescription)")
            }
        }
    }
    
    func tappedFilerSettingBtn() {
        router?.routeToFilterSettings()
    }
}



