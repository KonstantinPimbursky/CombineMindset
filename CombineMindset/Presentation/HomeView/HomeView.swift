//
//  HomeView.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 06.07.2025.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            List {
                Section("Combine Basics") {
                    NavigationLink("@Published & ObservableObject", destination: CombinePublishedView())
                    NavigationLink("PassthroughSubject", destination: PassthroughSubjectView())
                }
                
                Section("Combine Operators") {
                    NavigationLink("Transform", destination: TransformingOperatorsView())
                    NavigationLink("Filter", destination: FilteringOperatorsView())
                    NavigationLink("Combine", destination: Text("Combine"))
                    NavigationLink("Time manipulation", destination: Text("Time manipulation"))
                    NavigationLink("Sequence", destination: Text("Sequence"))
                    NavigationLink("Query", destination: Text("Query"))
                }
            }
            .scrollBounceBehavior(.basedOnSize)
            .navigationTitle("Combine Mindset")
        }
    }
}

#Preview {
    HomeView()
}
