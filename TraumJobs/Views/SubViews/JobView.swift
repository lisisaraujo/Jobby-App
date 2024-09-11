//
//  JobView.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 09.09.24.
//

import SwiftUI
import SwiftData

struct JobView: View {
    
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
            
            Text("Description:")
                .fontWeight(.bold)
            Text(job.details)
            Text("Salary:")
            Text(String(job.salary))
            
    
        }
        .padding()
    }
}

#Preview {
    let container = try! ModelContainer(for: Job.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    return JobView(job: Job(
        title: "Data Engineer",
        details: "Build and maintain data pipelines to collect, process, and store large amounts of data.", salary: 2000,
        isFavorited: false,
        location: "San Francisco, CA",
        contractType: "Full-time",
        isActive: true
    ))
    .modelContainer(container)
}
