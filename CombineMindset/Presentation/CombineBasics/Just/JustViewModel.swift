//
//  JustViewModel.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 27.07.2025.
//

import Combine
import Foundation

final class JustViewModel: ObservableObject {
    
    // MARK: - Types
    
    enum SampleError: Error, LocalizedError {
        case failed
        
        var errorDescription: String? {
            "error occurred"
        }
    }
    
    // MARK: - Public Properties
    
    @Published var outputText: String = "Click the button"
    
    // MARK: - Private Properties
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Public Methods
    
    func sendJust() {
        Just("Hello from Combine!")
            .sink { [weak self] value in
                self?.outputText = "Success: \(value)"
            }
            .store(in: &cancellables)
    }
    
    func sendFail() {
        Fail<String, SampleError>(error: .failed)
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.outputText = "Error: \(error.localizedDescription)"
                }
            }, receiveValue: { _ in })
            .store(in: &cancellables)
    }
}
