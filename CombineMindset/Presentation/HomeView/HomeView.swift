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
                NavigationLink("Combine Basics", destination: { CombineBasicsView() })
                NavigationLink("Operators Mastery", destination: { OperatorsMasteryView() })
                NavigationLink("MVVM Integration", destination: { MVVMIntegrationView() })
                NavigationLink("Networking with Combine", destination: { NetworkingView() })
            }
            .scrollBounceBehavior(.basedOnSize)
            .safeAreaPadding(.vertical, 24)
            .navigationTitle(Text("Combine Mindset"))
        }
    }
}

#Preview {
    HomeView()
}
