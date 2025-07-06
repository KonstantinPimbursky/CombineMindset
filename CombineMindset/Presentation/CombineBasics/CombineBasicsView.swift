//
//  CombineBasicsView.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 06.07.2025.
//

import SwiftUI

struct CombineBasicsView: View {
    var body: some View {
        List {
            NavigationLink("@Published & ObservableObject", destination: CombinePublishedView())
        }
        .navigationTitle("Combine Basics")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CombineBasicsView()
}
