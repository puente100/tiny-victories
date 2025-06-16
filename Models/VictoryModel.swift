//
//  VictoryModel.swift
//  TinyVictories
//
//  Created by Daniel Puente on 6/12/25.
//

import Foundation

struct Victory: Identifiable, Codable, Equatable {
    let id: UUID
    let title: String
    let description: String?
    let date: Date

    init(title: String, description: String? = nil, date: Date = Date()) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.date = date
    }
}
