//
//  SubscriberView.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 27.07.2025.
//

import SwiftUI

struct SubscriberView: View {
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel = SubscriberViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Example")
                .font(.title2)
                .bold()
            
            Text(viewModel.timerText)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            
            HStack(spacing: 20) {
                Button("Start") {
                    viewModel.startTimer()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Stop") {
                    viewModel.stopTimer()
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .navigationTitle("Subscriber")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            viewModel.stopTimer()
        }
    }
}

#Preview {
    SubscriberView()
}
