//
//  CombinePublishedView.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 06.07.2025.
//

import SwiftUI

struct CombinePublishedView: View {
    
    // MARK: - Private Properties
    
    @StateObject var viewModel = CombinePublishedViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Entered text: \(viewModel.name)")
                .padding(8)
            
            TextField("Enter text", text: $viewModel.name)
                .padding(8)
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Spacer()
        }
        .padding(24)
        .navigationTitle("@Published & ObservableObject")
    }
}

#Preview {
    CombinePublishedView()
}
