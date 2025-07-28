//
//  ErrorHandlingView.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 28.07.2025.
//

import SwiftUI

struct ErrorHandlingView: View {
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel = ErrorHandlingViewModel()
    
    // MARK: - Body

    var body: some View {
        VStack(spacing: 20) {
            Text("⚠️ catch + retry")
                .font(.title2)
                .bold()

            Button("Request") {
                viewModel.performRequest()
            }
            .buttonStyle(.borderedProminent)

            Text(viewModel.outputText)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red.opacity(0.1))
                .cornerRadius(8)

            Spacer()
        }
        .padding()
        .navigationTitle(String(".catch(_:) & .retry(_:)"))
        .navigationBarTitleDisplayMode(.inline)
    }
}
