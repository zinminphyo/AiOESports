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
    
    var isEmpty: Bool {
        return headCoach == nil && assistantCoach == nil && technicalDirector == nil && analyst == nil && roster.isEmpty
    }
    
    enum CodingKeys: String, CodingKey {
        case headCoach = "headcoach"
        case assistantCoach = "asistcoach"
        case technicalDirector = "technicaldirector"
        case analyst = "analyst"
        case roster
    }
}
