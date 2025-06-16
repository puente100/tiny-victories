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

    /// Load victories from local store
    func load() {
        store.load()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.victories = $0
            }
            .store(in: &cancellables)
    }

    /// Add a new victory and update local store
    func addVictory(title: String, description: String? = nil) {
        let newVictory = Victory(title: title, description: description)
        victories.insert(newVictory, at: 0)
        store.save(victories)
    }

    /// Get count of victories from today
    var victoriesTodayCount: Int {
        let calendar = Calendar.current
        return victories.filter { calendar.isDateInToday($0.date) }.count
    }
}