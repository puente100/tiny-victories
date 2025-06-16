//
//  VictoryStore.swift
//  TinyVictories
//
//  Created by Daniel Puente on 6/12/25.
//


import Foundation
import Combine

class VictoryStore {
    static let shared = VictoryStore()
    
    private let storageKey = "victories"

    /// Load victories from UserDefaults
    func load() -> AnyPublisher<[Victory], Never> {
        let data = UserDefaults.standard.data(forKey: storageKey)
        let victories = (data.flatMap { try? JSONDecoder().decode([Victory].self, from: $0) }) ?? []
        return Just(victories).eraseToAnyPublisher()
    }

    /// Save victories to UserDefaults
    func save(_ victories: [Victory]) {
        if let data = try? JSONEncoder().encode(victories) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
}