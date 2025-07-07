//
//  PassthroughSubjectView.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 06.07.2025.
//

import SwiftUI

struct PassthroughSubjectView: View {
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel = PassthroughSubjectViewModel()
    
    // MARK: - Body
    
    var body: some View {
        Button {
            viewModel.buttonTapped.send()
        } label: {
            Text("Button to tap")
        }
        .navigationTitle("PassthroughSubject")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PassthroughSubjectView()
}
