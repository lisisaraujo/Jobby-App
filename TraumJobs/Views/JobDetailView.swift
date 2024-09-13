//
//  JobDetailView.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 13.09.24.
//

import SwiftUI
import SwiftData

struct JobDetailView: View {
    
    @Environment(\.modelContext) var context
    var newJob: Job = Job(
        company: sampleCompanies[0], title: "",
        details: "",
        salary: 000,
        location: "",
        contractType: "",
        isActive: true)
    
    
    @State private var showAddSkillsSheet: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
                Button(action: {
                    showAddSkillsSheet = true
                }) {
                    Image(systemName: "sparkle")
                    Text("Add Skills")
                }
            }
            .padding()
            
            Text(newJob.isActive ? "Active" : "Disabled")
                .fontWeight(.bold)
                .foregroundColor(newJob.isActive ? .green : .red)
            
            Text(newJob.title)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(newJob.contractType)
                .font(.subheadline)
                .foregroundColor(.blue)
            
            Text("Description:")
                .fontWeight(.bold)
            Text(newJob.details)
            Text("Salary:")
                .fontWeight(.bold)
            Text(String(newJob.salary))
            Text("Skills:")
                .fontWeight(.bold)
            
            ForEach(newJob.skills) { skill in
                HStack{
                    Text("\(skill.title): ")
                    Text(skill.details)
                }
          
             
            }
        }
        .padding()
        .sheet(isPresented: $showAddSkillsSheet) {
            AddSkillView(showAddSkillsSheet: $showAddSkillsSheet, job: newJob)
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: Job.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    return JobDetailView(newJob: Job(
        company: Company(name: "Acme Corp", location: "San Francisco, CA", teamSize: 500, branche: "Technology", foundationYear: 1990), title: "Data Engineer",
        details: "Build and maintain data pipelines to collect, process, and store large amounts of data.",
        salary: 2000,
        isFavorited: false,
        location: "San Francisco, CA",
        contractType: "Full-time",
        isActive: true
    ))
    .modelContainer(container)
}
