//
//  Job.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 09.09.24.
//

import Foundation

struct Job: Identifiable{
    let id: UUID = UUID()
    var company: Company
    var title: String
    var details: String
    var isFavorited: Bool
    var skills: [Skill]
    var location: String
    var contractType: String
    var isActive: Bool
    var postDate: Date = Date()
}
