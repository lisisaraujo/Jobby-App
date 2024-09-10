//
//  JobsView.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 09.09.24.
//

import SwiftUI
import SwiftData

struct JobsView: View {
    
    @Binding var username: String
    @Environment(\.modelContext) var context
    @Query var jobs: [Job]
    @State private var path = NavigationPath()
    
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Welcome \(username)")
                    .font(.largeTitle)
                    .padding()
                
                List(jobs) { job in
                    JobView(job: job)
                }
                
                Button(action: {
                    insertSampleJobs()
                }) {
                    Text("Insert Sample Jobs")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    path.append("JobAddView")
                }) {
                    Text("Add Job")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Jobs")
            .navigationDestination(for: String.self) { value in
                if value == "JobAddView" {
                    JobAddView(path: $path)
                }
            }
        }
    }
    
    
    
    private func insertSampleJobs() {
        
        let sampleJobs = [
            Job(
                company: Company(name: "Tech Innovations", location: "San Francisco, CA", teamSize: 50, branche: "Software Development", foundationYear: 2010),
                title: "Software Engineer",
                details: "Develop and maintain web applications using modern frameworks and best practices.",
                isFavorited: true,
                skills: [
                    Skill(title: "JavaScript", details: "A versatile programming language primarily used for web development."),
                    Skill(title: "React", details: "A JavaScript library for building user interfaces."),
                    Skill(title: "Node.js", details: "A JavaScript runtime built on Chrome's V8 JavaScript engine.")
                ],
                location: "San Francisco, CA",
                contractType: "Full-time",
                isActive: true
            ),
            Job(
                company: Company(name: "Data Insights", location: "New York, NY", teamSize: 30, branche: "Data Science", foundationYear: 2015),
                title: "Data Scientist",
                details: "Analyze complex data sets to uncover insights and drive business decisions.",
                isFavorited: false,
                skills: [
                    Skill(title: "Python", details: "A high-level programming language known for its readability."),
                    Skill(title: "SQL", details: "A domain-specific language used in programming for managing data."),
                    Skill(title: "Machine Learning", details: "A subset of AI that focuses on building systems that learn from data.")
                ],
                location: "New York, NY",
                contractType: "Full-time",
                isActive: true
            ),
            Job(
                company: Company(name: "SecureTech", location: "Seattle, WA", teamSize: 40, branche: "Cybersecurity", foundationYear: 2012),
                title: "Cybersecurity Analyst",
                details: "Monitor and protect an organization's computer systems and networks from threats.",
                isFavorited: true,
                skills: [
                    Skill(title: "Network Security", details: "Measures to protect the usability and integrity of a network."),
                    Skill(title: "Incident Response", details: "The approach to managing the aftermath of a security breach."),
                    Skill(title: "Penetration Testing", details: "Simulated cyber attacks to identify vulnerabilities.")
                ],
                location: "Seattle, WA",
                contractType: "Full-time",
                isActive: false
            ),
            Job(
                company: Company(name: "Mobile Solutions", location: "Austin, TX", teamSize: 20, branche: "Mobile Development", foundationYear: 2018),
                title: "Mobile Developer",
                details: "Design and develop mobile applications for iOS and Android platforms.",
                isFavorited: false,
                skills: [
                    Skill(title: "Swift", details: "A powerful programming language for iOS development."),
                    Skill(title: "Java", details: "A widely-used programming language for Android development."),
                    Skill(title: "React Native", details: "A framework for building native apps using React.")
                ],
                location: "Austin, TX",
                contractType: "Full-time",
                isActive: true
            ),
            Job(
                company: Company(name: "Design Studio", location: "Chicago, IL", teamSize: 25, branche: "UI/UX Design", foundationYear: 2016),
                title: "UI/UX Designer",
                details: "Create intuitive and visually appealing user interfaces for web and mobile applications.",
                isFavorited: true,
                skills: [
                    Skill(title: "Figma", details: "A web-based UI design tool."),
                    Skill(title: "Prototyping", details: "Creating early models of a product to test concepts."),
                    Skill(title: "User Research", details: "Understanding user needs and behaviors.")
                ],
                location: "Chicago, IL",
                contractType: "Full-time",
                isActive: true
            )]
        
        for job in sampleJobs {
            context.insert(job)
        }
        
    }
    
}

    #Preview {
        JobsView(username: .constant("Lisis"))
    }
