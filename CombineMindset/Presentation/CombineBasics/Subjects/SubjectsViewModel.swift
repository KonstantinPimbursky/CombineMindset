//
//  SubjectsViewModel.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 06.07.2025.
//

import Combine
import Foundation

/// Показывает работу с `PassthroughSubject` и `CurrentValueSubject`
///
/// **Цель:**
/// Показать разницу между `PassthroughSubject` и `CurrentValueSubject`:
/// - Как они отправляют значения
/// - Что получают подписчики
/// - Как хранят последнее значение (или не хранят)
///
/// **Поведение:**
///
final class SubjectsViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var passthroughOutput: String = "—"
    @Published var currentValueOutput: String = "—"
    
    // MARK: - Private PRopreties
    
    private var cancellables = Set<AnyCancellable>()
    
    /// `PassthroughSubject` не хранит значение. Получатель получает только новые `.send()`
    private let passthroughSubject = PassthroughSubject<String, Never>()
    /// `CurrentValueSubject` Хранит последнее значение и отправляет его сразу при подписке
    private let currentValueSubject = CurrentValueSubject<String, Never>("Start")
    
    // MARK: - Initializers
    
    init() {
        subscribeToSubjects()
    }
    
    // MARK: - Public Methods
    
    func sendToPassthrough(_ text: String) {
        passthroughSubject.send(text)
    }
    
    func sendToCurrentValue(_ text: String) {
        currentValueSubject.send(text)
    }
    
    func resetValue() {
        passthroughOutput = "—"
        currentValueOutput = "—"
    }
    
    func resubscribeToSubjects() {
        cancellables.removeAll()
        subscribeToSubjects()
    }
    
    // MARK: - Private Properties
    
    private func subscribeToSubjects() {
        passthroughSubject
            .sink { [weak self] value in
                self?.passthroughOutput = value
            }
            .store(in: &cancellables)
        
        currentValueSubject
            .sink { [weak self] value in
                self?.currentValueOutput = value
            }
            .store(in: &cancellables)
    }
}
