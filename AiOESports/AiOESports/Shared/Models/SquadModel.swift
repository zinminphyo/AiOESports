//
//  SquadObject.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 10/04/2023.
//

import Foundation



struct SquadModel: Decodable {
    let headCoach: CoachModel?
    let assistantCoach: CoachModel?
    let technicalDirector: CoachModel?
    let analyst: CoachModel?
    let roster: [RosterModel]
}
