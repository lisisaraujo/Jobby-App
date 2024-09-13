//
//  AddSkillView.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 13.09.24.
//

import SwiftUI
import SwiftData

struct AddSkillView: View {
    
    @Environment(\.modelContext) var context
    @State private var title: String = ""
    @State private var description: String = ""
    @Binding  var showAddSkillsSheet: Bool

    var job: Job
    
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Add Skills")) {
                    TextField("Title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Description", text: $description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        let newSkill = Skill(title: title, details: description)
                        context.insert(newSkill)
                        job.skills.append(newSkill)
                        showAddSkillsSheet = false 
                        
                    }) {
                        Text("Add Skill")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
        }
        
    }
}

        #Preview {
            let container = try! ModelContainer(for: Job.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
            let company = sampleCompanies[0]
       
            let job1 = Job(
                company: company, title: "Software Engineer",
                details: "Develop and maintain web applications using modern frameworks and best practices.",
                salary: 55000,
                isFavorited: true,
                location: "San Francisco, CA",
                contractType: "Full-time",
                isActive: true
            )
            container.mainContext.insert(job1)
            
            return AddSkillView(showAddSkillsSheet: .constant(false), job: job1)
            .modelContainer(container)
        }
 
