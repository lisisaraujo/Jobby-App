//
//  JobView.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 09.09.24.
//

import SwiftUI
import SwiftData

struct JobListItemView: View {
    
  var job: Job
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
              
            Text(job.isActive ? "Active" : "Disabled")
                .fontWeight(.bold)
                .foregroundColor(job.isActive ? .green : .red)
            
            Text(job.title)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(job.contractType)
                .font(.subheadline)
                .foregroundColor(.blue)
            
        }
        .padding()
    }
}

#Preview {
    let container = try! ModelContainer(for: Job.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    return JobListItemView(job: Job(
        company: Company(name: "Acme Corp", location: "San Francisco, CA", teamSize: 500, branche: "Technology", foundationYear: 1990), title: "Data Engineer",
        details: "Build and maintain data pipelines to collect, process, and store large amounts of data.", salary: 2000,
        isFavorited: false,
        location: "San Francisco, CA",
        contractType: "Full-time",
        isActive: true
    ))
    .modelContainer(container)
}
