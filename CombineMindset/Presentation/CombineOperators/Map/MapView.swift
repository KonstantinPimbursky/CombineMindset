//
//  MapView.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 27.07.2025.
//

import SwiftUI

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Map Operator")
                .font(.title2)
                .bold()

            TextField("Введите текст", text: $viewModel.inputText)
                .textFieldStyle(.roundedBorder)

            Text(viewModel.mappedText)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.cyan.opacity(0.1))
                .cornerRadius(8)

            Spacer()
        }
        .padding()
        .navigationTitle(".map(_:)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MapView()
}
