//
//  ErrorHandlingViewModel.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 28.07.2025.
//

import Combine
import Foundation

/// ErrorHandlingExample — обработка ошибок с `catch` и `retry`
///
/// **Цель:**
/// Показать:
/// - Как `Publisher` может завершиться с ошибкой
/// - Как можно перехватить ошибку и заменить значение (`catch`)
/// - Как можно повторить попытку несколько раз (`retry`)
final class ErrorHandlingViewModel: ObservableObject {
    
    // MARK: - Types
    
    enum MockError: Error, LocalizedError {
        case failed
        
        var errorDescription: String? {
            "❌ Error executing request"
        }
    }
    
    // MARK: - Public Properties
    
    @Published var outputText: String = "Click Request"
    
    // MARK: - Private Properties

    private var cancellables = Set<AnyCancellable>()
    private var attempt = 0

    // MARK: - Public Methods

    func performRequest() {
        outputText = "🔄 Отправка запроса..."
        attempt = 0

        Deferred { [weak self] in
            self?.makeRetryableRequest() ?? Empty().eraseToAnyPublisher()
        }
        .retry(3)
        .catch { error in
            Just(error.localizedDescription)
        }
        .sink { [weak self] result in
            self?.outputText = result
        }
        .store(in: &cancellables)
    }
    
    // MARK: - Private Methods

    private func makeRetryableRequest() -> AnyPublisher<String, MockError> {
        attempt += 1
        print("🚀 Попытка №\(attempt)")

        return Future<String, MockError> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if Bool.random() {
                    promise(.success("✅ Успешно (попытка \(self.attempt))"))
                } else {
                    promise(.failure(.failed))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
