//
//  JobView.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 09.09.24.
//

import SwiftUI

struct JobView: View {
    
    var job: Job
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(job.company.name)
                .font(.headline)
            Text(job.company.location)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(job.isActive ? "Active" : "Disabled")
                .fontWeight(.bold)
                .foregroundColor(job.isActive ? .green : .red)
            
            Text(job.title)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(job.contractType)
                .font(.subheadline)
                .foregroundColor(.blue)
            
            Text("Description:")
                .fontWeight(.bold)
            Text(job.details)
            
            Text("Required skills:")
                .fontWeight(.bold)
            ForEach(job.skills) { skill in
                Text(skill.title)
            }
        }
        .padding()
    }
}

#Preview {
    JobView(job: Job(
        company: Company(name: "Data Solutions", location: "San Francisco, CA", teamSize: 40, branche: "Data Engineering", foundationYear: 2017),
        title: "Data Engineer",
        details: "Build and maintain data pipelines to collect, process, and store large amounts of data.",
        isFavorited: false,
        skills: [
            Skill(title: "Python", details: "A programming language commonly used for data analysis."),
            Skill(title: "Apache Spark", details: "An open-source unified analytics engine for big data processing."),
            Skill(title: "AWS Glue", details: "A fully managed ETL service for preparing data for analytics.")
        ],
        location: "San Francisco, CA",
        contractType: "Full-time",
        isActive: true
    ))
}
