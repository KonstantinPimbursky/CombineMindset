//
//  FilterViewModel.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 28.07.2025.
//

import Combine
import Foundation

/// FilterExample — фильтрация значений с помощью filter
///
/// **Цель:**
/// Показать, как filter пропускает только те значения, которые соответствуют определённому условию.
/// Например: только чётные числа, только строки длиннее 5 символов и т.д.
final class FilterViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var inputText: String = ""
    @Published var outputText: String = "Enter number"
    
    // MARK: - Private Properties

    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Iniaitializers

    init() {
        $inputText
            .compactMap { Int($0) } // Преобразуем строку в Int
            .filter { $0 % 2 == 0 } // Пропускаем только чётные
            .map { "Even number: \($0)" }
            .sink { [weak self] value in
                self?.outputText = value
            }
            .store(in: &cancellables)
        
        // Отдельно обрабатываем нечётные/неподходящие значения
        $inputText
            .debounce(for: .milliseconds(200), scheduler: RunLoop.main)
            .filter { Int($0) == nil || Int($0)! % 2 != 0 }
            .sink { [weak self] _ in
                self?.outputText = "Odd or invalid number"
            }
            .store(in: &cancellables)
    }
}
