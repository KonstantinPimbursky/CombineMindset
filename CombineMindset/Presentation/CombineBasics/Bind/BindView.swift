//
//  BindView.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 27.07.2025.
//

import SwiftUI

struct BindView: View {
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel = BindViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            Text("TextField ↔ Combine ↔ Label")
                .font(.title2)
                .bold()
            
            TextField("Enter something...", text: $viewModel.inputText)
                .textFieldStyle(.roundedBorder)
            
            Text(viewModel.transformedText)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green.opacity(0.1))
                .cornerRadius(8)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Bind Example")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    BindView()
}
