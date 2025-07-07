//
//  TransformingOperatorsViewModel.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 06.07.2025.
//

import Combine
import Foundation

final class TransformingOperatorsViewModel: ObservableObject {
    
    // MARK: - Public Methods
    
    func scanDidTapped() {
        var subscriptions = Set<AnyCancellable>()
        let range = (0...5)
        print("\n== scan ==")
        range.publisher
            .scan(0) { return $0 + $1 }
            .sink { print("\($0)", terminator: " ") }
            .store(in: &subscriptions)
    }
    
    func collectDidTapped() {
        var subscriptions = Set<AnyCancellable>()
        let publisher = PassthroughSubject<Int, Never>()
        
        print("\n== collect ==")
        publisher
            .collect()
            .sink(receiveValue: {
                print("all values as array: ")
                print($0)
            }).store(in: &subscriptions)

        publisher
            .collect(2)
            .sink(receiveValue: {
                print("array elements limited by 2: ")
                print($0)
            }).store(in: &subscriptions)

        publisher.send(1)
        publisher.send(2)
        publisher.send(3)
        publisher.send(completion: .finished)
    }
    
    func mapFlatMapDidTapped() {
        
    }
    
    func replaceDidTapped() {
        
    }
}
