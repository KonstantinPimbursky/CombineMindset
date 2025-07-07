//
//  TransformingOperatorsView.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 06.07.2025.
//

import SwiftUI

struct TransformingOperatorsView: View {
    
    // MARK: - Types
    
    typealias Model = TransformingOperatorsModel
    
    // MARK: - Private Properties
    
    @StateObject private var viewModel = TransformingOperatorsViewModel()
    private let model = Model.allCases
    
    // MARK: - Body
    
    var body: some View {
        List {
            ForEach(model, id: \.self) { method in
                Button {
                    switch method {
                    case .scan:
                        viewModel.scanDidTapped()
                    case .collect:
                        viewModel.collectDidTapped()
                    case .mapAndFlatMap:
                        viewModel.mapFlatMapDidTapped()
                    case .replace:
                        viewModel.replaceDidTapped()
                    }
                } label: {
                    Text(method.title)
                        .foregroundStyle(.black)
                }
            }
        }
        .navigationTitle("Transforming Operators")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    TransformingOperatorsView()
}
