//
//  JustView.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 27.07.2025.
//

import SwiftUI

struct JustView: View {
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel = JustViewModel()
    
    // MARK: - Bod
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Example")
                .font(.title2)
                .bold()
            
            Text(viewModel.outputText)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            
            HStack(spacing: 20) {
                Button("Send Just") {
                    viewModel.sendJust()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Send Fail") {
                    viewModel.sendFail()
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .navigationTitle("Just & Fail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    JustView()
}
