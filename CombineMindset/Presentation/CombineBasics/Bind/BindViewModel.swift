//
//  BindViewModel.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 27.07.2025.
//

import Combine
import Foundation

/// `TextField` → `Combine` → `Text` — реактивное связывание с трансформацией данных.
///
/// **Цель**: Показать, как `@Published` из ViewModel превращается в `Publisher`,
/// на который можно подписаться и модифицировать поток данных, прежде чем отправить результат обратно в View.
///
/// **Ключевые концепты:**
/// - `@Published var inputText`
/// - Реактивная обработка ввода пользователя
/// - Преобразование данных с `Combine` (например, `map`, `debounce`)
/// - Вывод результата в `Text`
final class BindViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var inputText: String = ""
    @Published var transformedText: String = "Enter text..."
    
    // MARK: - Private Properties

    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initializers
    
    init() {
        $inputText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { text in
                text.isEmpty ? "Empty" : "Upper case: \(text.uppercased())"
            }
            .assign(to: &$transformedText)
    }
}
