//
//  DebounceView.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 28.07.2025.
//

import SwiftUI

struct DebounceView: View {
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel = DebounceViewModel()
    
    // MARK: - Body

    var body: some View {
        VStack(spacing: 20) {
            Text("Debounce Operator")
                .font(.title2)
                .bold()

            TextField("Enter your search term", text: $viewModel.searchText)
                .textFieldStyle(.roundedBorder)

            Text(viewModel.outputText)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple.opacity(0.1))
                .cornerRadius(8)

            Spacer()
        }
        .padding()
        .navigationTitle(".debounce(for:scheduler:options:)")
        .navigationBarTitleDisplayMode(.inline)
    }
}
