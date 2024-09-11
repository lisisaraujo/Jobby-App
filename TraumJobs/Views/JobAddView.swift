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
    @State private var salary: Int = 0
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Job Details")) {
                    TextField("Job Title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Job Description", text: $description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Salary", value: $salary, format: .number)
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
    
        
        let newJob = Job(
                         title: title,
                         details: description,
                         salary: salary,
                         isFavorited: false,
                         location: "",
                         contractType: "",
                         isActive: true)
        
       
        context.insert(newJob)
        
    }
}

#Preview {
    JobAddView(path: .constant(NavigationPath()))
}
