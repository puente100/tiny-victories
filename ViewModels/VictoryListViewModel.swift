//
//  VictoryListViewModel.swift
//  TinyVictories
//
//  Created by Daniel Puente on 6/12/25.
//


import Foundation
import Combine

class VictoryListViewModel: ObservableObject {
    @Published private(set) var victories: [Victory] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let store: VictoryStore

    init(store: VictoryStore = .shared) {
        self.store = store
        load()
    }

    func load() {
        store.load()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.victories = $0
            }
            .store(in: &cancellables)
    }

    func addVictory(title: String, description: String? = nil) {
        let newVictory = Victory(title: title, description: description)
        victories.insert(newVictory, at: 0)
        store.save(victories)
    }
    
    func deleteVictory(at offsets: IndexSet) {
        victories.remove(atOffsets: offsets)
        store.save(victories)
    }

    var victoriesTodayCount: Int {
        let calendar = Calendar.current
        return victories.filter { calendar.isDateInToday($0.date) }.count
    }
}
