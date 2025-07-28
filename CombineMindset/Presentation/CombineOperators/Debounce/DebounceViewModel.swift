//
//  DebounceViewModel.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 28.07.2025.
//

import Combine
import Foundation

/// DebounceExample — задержка событий с debounce
///
/// **Цель:**
/// Показать, как debounce отфильтровывает слишком частые изменения и пропускает только последнее значение после паузы.
/// Типичный кейс — поиск при вводе текста, когда запрос не отправляется на каждый символ.
final class DebounceViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var searchText: String = ""
    @Published var outputText: String = "Enter your request..."
    
    // MARK: - Private Properties

    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initializers

    init() {
        // Реакция с debounce
        $searchText
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { text -> String in
                guard !text.isEmpty else { return "Enter your request..." }
                return "Found: \(text.capitalized)"
            }
            .assign(to: &$outputText)

        // Немедленная реакция — до debounce
        $searchText
            .map { $0.isEmpty ? "Enter your request..." : "⏳Search..." }
            .assign(to: &$outputText)
    }
}
