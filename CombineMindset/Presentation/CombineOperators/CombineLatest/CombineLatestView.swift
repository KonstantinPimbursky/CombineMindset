//
//  CombineLatestView.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 28.07.2025.
//

import SwiftUI

struct CombineLatestView: View {
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel = CombineLatestViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            Text("CombineLatest Operator")
                .font(.title2)
                .bold()
            
            TextField("First Name", text: $viewModel.firstName)
                .textFieldStyle(.roundedBorder)
            
            TextField("Second Name", text: $viewModel.lastName)
                .textFieldStyle(.roundedBorder)
            
            Text(viewModel.fullName)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green.opacity(0.1))
                .cornerRadius(8)
            
            Spacer()
        }
        .padding()
        .navigationTitle("CombineLatest")
        .navigationBarTitleDisplayMode(.inline)
    }
}
