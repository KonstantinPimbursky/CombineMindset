//
//  MapViewModel.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 27.07.2025.
//

import Combine
import Foundation

/// MapExample — трансформация значений через map
///
/// Цель:
/// Показать, как map преобразует поток данных.
/// Простой случай: пользователь вводит текст → он автоматически преобразуется в верхний регистр или, например, в длину строки.
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
