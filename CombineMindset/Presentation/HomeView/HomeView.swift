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
                    NavigationLink(".map", destination: MapView())
                    NavigationLink(".filter", destination: FilterView())
                    NavigationLink(".debounce", destination: DebounceView())
                    NavigationLink(".combineLatest", destination: Text("combineLatest"))
                    NavigationLink(".zip", destination: Text("zip"))
                    NavigationLink(".catch / .retry", destination: Text("catch / retry"))
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
