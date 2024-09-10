//
//  Company.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 09.09.24.
//

import Foundation
import SwiftData

@Model
class Company: Identifiable {
    let id: UUID
    var name: String
    var location: String
    var teamSize: Int
    var branche: String
    var foundationYear: Int
    
    init(name: String, location: String, teamSize: Int, branche: String, foundationYear: Int) {
        self.id = UUID()
        self.name = name
        self.location = location
        self.teamSize = teamSize
        self.branche = branche
        self.foundationYear = foundationYear
    }
}


