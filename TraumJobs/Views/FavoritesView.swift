//
//  FavoritesView.swift
//  TraumJobs
//
//  Created by Lisis Ruschel on 11.09.24.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    
    @Binding var selection: Int
    @State private var path = NavigationPath()
    
    @Environment(\.modelContext) var context
    @Query var jobs: [Job]
    
    @Query(sort: \Job.title) var jobsSortedBytitle: [Job]
    
    @Query(filter: #Predicate<Job> { job in
        job.isFavorited == true
    }) var favoriteJobs: [Job]
    
    var body: some View {
        
        VStack {
            
            List(jobsSortedBytitle) { job in
                JobListItemView(job: job)
                    .swipeActions {
                        Button(job.isFavorited ? "Unfavorite" : "Favorite") {
                            toggleFavorite(job: job)
                        }
                        .tint(job.isFavorited ? .pink : .blue)
                    }
            }
            
        }
    }
    
    
    private func toggleFavorite(job: Job) {
        job.isFavorited.toggle()
        
        context.insert(job)
    }
    
    
}


#Preview {
    let container = try! ModelContainer(for: Job.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    return FavoritesView(selection: .constant(2)).modelContainer(container)
}
