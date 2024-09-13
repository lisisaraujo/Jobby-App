//
//  Job.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 09.09.24.
//

import Foundation
import SwiftData

@Model
class Job: Identifiable {
    let id: UUID
    var company: Company?
    var title: String
    var details: String
    var salary: Int
    var isFavorited: Bool
    var skills: [Skill]
    var location: String
    var contractType: String
    var isActive: Bool
    var postDate: Date
    
    init(company: Company, title: String, details: String, salary: Int, isFavorited: Bool = false, skills: [Skill] = [], location: String, contractType: String, isActive: Bool) {
        self.id = UUID()
        self.company = company
        self.title = title
        self.details = details
        self.salary = salary
        self.isFavorited = isFavorited
        self.skills = skills
        self.location = location
        self.contractType = contractType
        self.isActive = isActive
        self.postDate = Date()
    }
}
