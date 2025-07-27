//
//  SubscriberViewModel.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 27.07.2025.
//

import Combine
import Foundation

final class SubscriberViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var timerText: String = "Click the Start"
    
    // MARK: - Private Properties
    
    private var cancellables = Set<AnyCancellable>()
    private var counter = 0
    
    // MARK: - Public Methods
    
    func startTimer() {
        counter = 0
        Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .map { _ in
                self.counter += 1
                return "Timer: \(self.counter) sec"
            }
            .receive(on: DispatchQueue.main)
            .assign(to: \.timerText, on: self)
            .store(in: &cancellables)
    }
    
    func stopTimer() {
        cancellables.removeAll()
        timerText = "Timer stopped"
    }
}
