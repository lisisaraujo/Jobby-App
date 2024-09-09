//
//  Company.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 09.09.24.
//

import Foundation
struct Company: Identifiable {
    var id: UUID = UUID()
    var name: String
    var location: String
    var teamSize: Int
    var branche: String
    var foundationYear: Int
}
