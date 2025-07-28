//
//  CombineLatestViewModel.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 28.07.2025.
//

import Combine
import Foundation

/// CombineLatestExample — объединение значений из двух `Publishers`
///
/// Цель:
/// Показать, как combineLatest объединяет два потока данных и публикует новое значение каждый раз, когда один из них обновляется, при условии, что оба уже эмитировали хотя бы одно значение.
final class CombineLatestViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var fullName: String = "Enter your first and last name"
    
    // MARK: - Private Properties

    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initializers

    init() {
        Publishers.CombineLatest($firstName, $lastName)
            .map { first, last -> String in
                if first.isEmpty || last.isEmpty {
                    return "Enter your first and last name"
                } else {
                    return "👤Name: \(first) \(last)"
                }
            }
            .assign(to: &$fullName)
    }
}
