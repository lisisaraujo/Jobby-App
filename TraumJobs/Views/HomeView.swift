//
//  TabView.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 11.09.24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @State var selection: Int = 1
    @State private var path = NavigationPath()
    @State var selectedJob = Job(
        company: sampleCompanies[0], title: "",
        details: "",
        salary: 000,
        location: "",
        contractType: "",
        isActive: true)
    

    
    var body: some View {
        NavigationStack(path: $path) {
            VStack{
                
                HStack{
                    Spacer()
                    Button(action: {
                        path.append("JobAddView")
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.green)
                    }
                }
                
                Spacer()
                
                TabView(selection: $selection) {
                    JobsView(selection: $selection, path: $path)
                        .tabItem {
                            Label("All Jobs", systemImage: "bag.fill")
                        }
                        .tag(1)
                    
                    FavoritesView(selection: $selection)
                        .tabItem {
                            Label("Favorites", systemImage: "heart.fill")
                        }
                        .tag(2)
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
}

#Preview {
    HomeView()
}
