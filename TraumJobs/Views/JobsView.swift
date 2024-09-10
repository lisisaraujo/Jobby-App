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
                
                NavigationLink(destination: JobAddView(path: $path)) {
                    Text("Add Job")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Jobs")
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
            ),
            Job(
                company: Company(name: "DevOps Corp", location: "Boston, MA", teamSize: 60, branche: "DevOps", foundationYear: 2014),
                title: "DevOps Engineer",
                details: "Automate and streamline the software development and deployment process.",
                isFavorited: false,
                skills: [
                    Skill(title: "Docker", details: "A platform for developing, shipping, and running applications in containers."),
                    Skill(title: "Kubernetes", details: "An open-source system for automating the deployment, scaling, and management of applications."),
                    Skill(title: "AWS", details: "Amazon Web Services, a comprehensive cloud computing platform.")
                ],
                location: "Boston, MA",
                contractType: "Full-time",
                isActive: true
            ),
            Job(
                company: Company(name: "Product Innovations", location: "Los Angeles, CA", teamSize: 45, branche: "Product Management", foundationYear: 2013),
                title: "Product Manager",
                details: "Define and execute the product vision, working closely with engineering and design teams.",
                isFavorited: true,
                skills: [
                    Skill(title: "Agile", details: "A project management methodology that encourages iterative development."),
                    Skill(title: "Market Analysis", details: "Researching market trends and consumer needs."),
                    Skill(title: "Roadmapping", details: "Creating a strategic plan that outlines the vision and direction for a product.")
                ],
                location: "Los Angeles, CA",
                contractType: "Full-time",
                isActive: false
            ),
            Job(
                company: Company(name: "AI Solutions", location: "Seattle, WA", teamSize: 35, branche: "Machine Learning", foundationYear: 2019),
                title: "Machine Learning Engineer",
                details: "Develop and deploy machine learning models to solve complex problems.",
                isFavorited: false,
                skills: [
                    Skill(title: "Python", details: "A high-level programming language used for machine learning."),
                    Skill(title: "TensorFlow", details: "An open-source library for machine learning and artificial intelligence."),
                    Skill(title: "AWS SageMaker", details: "A fully managed service to build, train, and deploy machine learning models.")
                ],
                location: "Seattle, WA",
                contractType: "Full-time",
                isActive: true
            ),
            Job(
                company: Company(name: "Full Stack Devs", location: "New York, NY", teamSize: 50, branche: "Web Development", foundationYear: 2011),
                title: "Full-Stack Developer",
                details: "Design and implement end-to-end web applications, working on both front-end and back-end.",
                isFavorited: true,
                skills: [
                    Skill(title: "JavaScript", details: "A programming language that enables interactive web pages."),
                    Skill(title: "React", details: "A JavaScript library for building user interfaces."),
                    Skill(title: "Node.js", details: "A JavaScript runtime built on Chrome's V8 engine."),
                    Skill(title: "SQL", details: "A language for managing and querying relational databases.")
                ],
                location: "New York, NY",
                contractType: "Full-time",
                isActive: true
            ),
            Job(
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
            )
        ]
        
        for job in sampleJobs {
            context.insert(job)
        }
        
    }
    
}

    #Preview {
        JobsView(username: .constant("Lisis"))
    }
