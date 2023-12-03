//
//  DetailsViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 09/04/2023.
//

import Foundation


protocol DetailsViewDelegate {
    var presenter: DetailsPresenter? { get set }
    func renderDetails(details: TeamDetails)
    func renderPlayerDetails(details: PlayerDetails)
    func renderCasterDetails(details: CasterDetails)
    func renderCreatorDetails(details: CasterDetails)
}
