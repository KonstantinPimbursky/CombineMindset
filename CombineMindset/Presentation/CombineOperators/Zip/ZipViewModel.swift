//
//  ZipViewModel.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 28.07.2025.
//

import Combine
import Foundation

/// ZipExample — синхронное объединение значений с `zip`
///
/// **Цель:**
/// Показать, как `zip` объединяет значения один-к-одному из двух потоков:
/// - он ждёт, пока оба источника эмитируют значение,
/// - и только тогда публикует пару.
/// Очень удобно для “синхронизации” событий.
final class ZipViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var output: String = "Press A and B"
    
    // MARK: - Private Proeprties

    private var cancellables = Set<AnyCancellable>()

    private let subjectA = PassthroughSubject<String, Never>()
    private let subjectB = PassthroughSubject<String, Never>()

    private var aCounter = 0
    private var bCounter = 0
    
    // MARK: - Initializers

    init() {
        subjectA
            .zip(subjectB)
            .map { a, b in
                "🧩 Combination: A\(a) + B\(b)"
            }
            .sink { [weak self] result in
                self?.output = result
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Public Methods

    func sendA() {
        aCounter += 1
        subjectA.send("\(aCounter)")
    }

    func sendB() {
        bCounter += 1
        subjectB.send("\(bCounter)")
    }

    func reset() {
        output = "Press A and B"
        aCounter = 0
        bCounter = 0
    }
}
