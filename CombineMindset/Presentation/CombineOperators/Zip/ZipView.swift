//
//  ZipView.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 28.07.2025.
//

import SwiftUI

struct ZipView: View {
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel = ZipViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Zip Operator")
                .font(.title2)
                .bold()
            
            HStack {
                Button("Send A") {
                    viewModel.sendA()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Send B") {
                    viewModel.sendB()
                }
                .buttonStyle(.borderedProminent)
            }
            
            Text(viewModel.output)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)
            
            Button("Reset") {
                viewModel.reset()
            }
            .padding(.top)
            
            Spacer()
        }
        .padding()
        .navigationTitle(".zip(_:)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ZipView()
}
