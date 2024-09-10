//
//  Skill.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 09.09.24.
//

import Foundation
import SwiftData

@Model
class Skill: Identifiable {
    let id: UUID
    var title: String
    var details: String
    
    init(title: String, details: String) {
        self.id = UUID()
        self.title = title
        self.details = details
    }
}
