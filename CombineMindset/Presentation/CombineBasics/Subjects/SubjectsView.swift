//
//  SubjectsView.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 06.07.2025.
//

import SwiftUI

struct SubjectsView: View {
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel = SubjectsViewModel()
    @State private var passthroughInput = ""
    @State private var currentValueInput = ""
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Example")
                    .font(.title2)
                    .bold()
                
                VStack(spacing: 10) {
                    Text("🔵 PassthroughSubject")
                        .font(.headline)
                    
                    TextField("Введите текст", text: $passthroughInput)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Send to Passthrough") {
                        viewModel.sendToPassthrough(passthroughInput)
                        passthroughInput = ""
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Text("Output: \(viewModel.passthroughOutput)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                }
                
                Divider()
                
                VStack(spacing: 10) {
                    Text("🟣 CurrentValueSubject")
                        .font(.headline)
                    
                    TextField("Enter text", text: $currentValueInput)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Send to CurrentValue") {
                        viewModel.sendToCurrentValue(currentValueInput)
                        currentValueInput = ""
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Text("Output: \(viewModel.currentValueOutput)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple.opacity(0.1))
                        .cornerRadius(8)
                }
                
                Button("Reset") {
                    viewModel.resetSubjects()
                }
                .padding(.top, 20)
            }
            .padding()
        }
        .scrollBounceBehavior(.basedOnSize)
        .navigationTitle("Subjects")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SubjectsView()
}
