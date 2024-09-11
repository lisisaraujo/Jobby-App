//
//  JobAddView.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 10.09.24.
//

//
//  JobAddView.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 10.09.24.
//

import SwiftUI
import SwiftData

struct JobAddView: View {
    
    @Environment(\.modelContext) var context 
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var salary: String = ""
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Job Details")) {
                    TextField("Job Title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Job Description", text: $description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Salary", text: $salary)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: {
                    saveJobDetails()
                    path.removeLast()

                
                }) {
                    Text("Save Job")
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
    
    private func saveJobDetails() {
        guard Double(salary) != nil else {
            print("Invalid salary input")
            return
        }
        
        let newJob = Job(company: Company(name: "", location: "", teamSize: 2, branche: "", foundationYear: 2024),
                         title: title,
                         details: description,
                         isFavorited: false,
                         skills: [],
                         location: "",
                         contractType: "",
                         isActive: true)
        
       
        context.insert(newJob)
        
    }
}

#Preview {
    JobAddView(path: .constant(NavigationPath()))
}
