//
//  MapViewModel.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 27.07.2025.
//

import Combine
import Foundation

final class MapViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var inputText: String = ""
    @Published var mappedText: String = "Result will be here"
    
    // MARK: - Private Properties

    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initializers

    init() {
        $inputText
            .map { input in
                input.isEmpty ? "Empty" : "🔠 \(input.uppercased())"
            }
            .assign(to: &$mappedText)
    }
}
