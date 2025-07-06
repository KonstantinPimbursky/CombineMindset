//
//  PassthroughSubjectViewModel.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 06.07.2025.
//

import Combine
import Foundation

final class PassthroughSubjectViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    let buttonTapped = PassthroughSubject<Void, Never>()
    
    // MARK: - Private Properties
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initializers
    
    init() {
        bind()
    }
    
    // MARK: - Private Methods
    
    private func bind() {
        buttonTapped
            .sink { _ in
                print("Button was tapped")
            }
            .store(in: &cancellables)
    }
}
