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
                    NavigationLink("Just & Fail", destination: JustView())
                    NavigationLink("Subscriber", destination: SubscriberView())
                    NavigationLink("Subjects", destination: SubjectsView())
                    NavigationLink("TextField → Combine → Label", destination: BindView())
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
