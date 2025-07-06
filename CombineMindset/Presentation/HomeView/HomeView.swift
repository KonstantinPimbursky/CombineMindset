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
                NavigationLink("Combine Basics", destination: CombineBasicsView())
                NavigationLink("Combine Operators", destination: CombineOperatorsView())
                NavigationLink("MVVM Integration", destination: MVVMIntegrationView())
                NavigationLink("Networking", destination: NetworkingView())
            }
            .scrollBounceBehavior(.basedOnSize)
            .safeAreaPadding(.vertical, 24)
            .navigationTitle(Text("Combine Mindset"))
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    HomeView()
}
