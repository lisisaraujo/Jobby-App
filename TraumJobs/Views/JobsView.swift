//
//  JobsView.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 09.09.24.
//

import Foundation
import SwiftUI
import SwiftData

struct JobsView: View {
    
    @Binding var selection: Int
    @Environment(\.modelContext) var context
    
    @State private var selectedSortingOption: SortingOptions = .title
    
    @Query(sort: \Job.title) var jobs: [Job]
    
    var sortedJobs: [Job] {
        switch selectedSortingOption {
        case .title:
            return jobs.sorted { $0.title < $1.title }
        case .postDate:
            return jobs.sorted { $0.postDate > $1.postDate }
        case .isActive:
            return jobs.sorted { $0.isActive && !$1.isActive }
        }
    }
    
    var body: some View {
        
        VStack {
            HStack{
                Spacer()
                Picker("Sort by", selection: $selectedSortingOption) {
                    ForEach(SortingOptions.allCases, id: \.self) { option in
                        Text(option.rawValue).tag(option)
                    }
                }
                .pickerStyle(.automatic)
                .padding()
            }
          
            
            List(sortedJobs) { job in
                JobView(job: job)
                    .swipeActions {
                        Button(job.isFavorited ? "Unfavorite" : "Favorite") {
                            toggleFavorite(job: job)
                        }
                        .tint(job.isFavorited ? .pink : .blue)
                    }
            }
        }
        .onAppear {
            insertSampleJobs()
        }
    }
    
    private func insertSampleJobs() {
        guard jobs.isEmpty else { return }
        
        let sampleJobs = [
            Job(
                
                title: "Software Engineer",
                details: "Develop and maintain web applications using modern frameworks and best practices.", salary: 55000,
                isFavorited: true,
                location: "San Francisco, CA",
                contractType: "Full-time",
                isActive: true
            ),
            Job(
                
                title: "Data Scientist",
                details: "Analyze complex data sets to uncover insights and drive business decisions.", salary: 45000,
                isFavorited: false,
                location: "New York, NY",
                contractType: "Full-time",
                isActive: true
            ),
            Job(
                
                title: "Cybersecurity Analyst",
                details: "Monitor and protect an organization's computer systems and networks from threats.", salary: 30000,
                isFavorited: true,
                location: "Seattle, WA",
                contractType: "Full-time",
                isActive: false
            ),
            Job(
               
                title: "Mobile Developer",
                details: "Design and develop mobile applications for iOS and Android platforms.", salary: 65000,
                isFavorited: false,
                location: "Austin, TX",
                contractType: "Full-time",
                isActive: true
            ),
            Job(
                
                title: "UI/UX Designer",
                details: "Create intuitive and visually appealing user interfaces for web and mobile applications.", salary: 48000,
                isFavorited: true,
                location: "Chicago, IL",
                contractType: "Full-time",
                isActive: true)]
        
        for job in sampleJobs {
            context.insert(job)
        }
    }
    
    private func toggleFavorite(job: Job) {
        job.isFavorited.toggle()
        context.insert(job)
    }
}

#Preview {
    let container = try! ModelContainer(for: Job.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    return JobsView(selection: .constant(1)).modelContainer(container)
}
