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
            }
            .scrollBounceBehavior(.basedOnSize)
            .navigationTitle("Combine Mindset")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    HomeView()
}
