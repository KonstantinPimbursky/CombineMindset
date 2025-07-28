//
//  FilterView.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 28.07.2025.
//

import SwiftUI

struct FilterView: View {
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel = FilterViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Filter Operator")
                .font(.title2)
                .bold()
            
            TextField("Enter number", text: $viewModel.inputText)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
            
            Text(viewModel.outputText)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange.opacity(0.1))
                .cornerRadius(8)
            
            Spacer()
        }
        .padding()
        .navigationTitle(".filter(_:)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FilterView()
}
