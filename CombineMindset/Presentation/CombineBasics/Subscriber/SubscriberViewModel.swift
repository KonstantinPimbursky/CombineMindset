//
//  SubscriberViewModel.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 27.07.2025.
//

import Combine
import Foundation

/// Показывает работу с `.assign`, `.sink`, таймером и `receive(on:)`
///
/// **Цель:**
/// Показать:
/// - как подписываться с помощью `.sink` и `.assign(to:on:)`
/// - обновление данных по таймеру
/// - переключение потока на главный поток (`.receive(on:)`)
/// - использование `@Published` в связке с `Combine`
final class SubscriberViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var timerText: String = "Click the Start"
    
    // MARK: - Private Properties
    
    private var timer: Publishers.Autoconnect<Timer.TimerPublisher>?
    private var cancellables = Set<AnyCancellable>()
    private var counter = 0
    
    // MARK: - Public Methods
    
    func startTimer() {
        counter = 0
        let timer = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
        timer
            .map { _ in
                self.counter += 1
                return "Timer: \(self.counter) sec"
            }
            .receive(on: DispatchQueue.main)
            .assign(to: \.timerText, on: self)
            .store(in: &cancellables)
        self.timer = timer
    }
    
    func stopTimer() {
        timer?.upstream.connect().cancel()
        cancellables.removeAll()
        timerText = "Timer stopped"
    }
}
