
//
//  VictoryRowView.swift
//  TinyVictories
//
//  Created by Daniel Puente on 6/12/25.
//


import SwiftUI

struct VictoryRowView: View {
    let victory: Victory

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(victory.title)
                .font(.headline)

            if let description = victory.description, !description.isEmpty {
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Text(victory.date.formatted(date: .abbreviated, time: .shortened))
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}
