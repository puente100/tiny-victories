//
//  HomeView.swift
//  TinyVictories
//
//  Created by Daniel Puente on 5/2/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = VictoryListViewModel()
    @State private var showSuccessMessage = false
    @State private var showingAdd = false

    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                
                Text("You've logged \(viewModel.victoriesTodayCount) victories today!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                if viewModel.victories.isEmpty {
                    Spacer()
                    Text("No victories yet")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                } else {
                    List {
                        ForEach(viewModel.victories) { victory in
                            VictoryRowView(victory: victory)
                        }
                        .onDelete(perform: viewModel.deleteVictory)
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .navigationTitle("Tiny Victories")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAdd = true
                    }) {
                        Label("New Victory", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAdd) {
                NewVictoryModalView { title, description in
                    if !title.trimmingCharacters(in: .whitespaces).isEmpty {
                        viewModel.addVictory(title: title, description: description)
                        
                        // Success feedback animation
                        showSuccessMessage = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showSuccessMessage = false
                            }
                        }
                    }
                    showingAdd = false
                }
            }
            .overlay(
                Group {
                    if showSuccessMessage {
                        Text("Victory added!")
                            .font(.headline)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(Color.green.opacity(0.95))
                            .cornerRadius(16)
                            .foregroundColor(.white)
                            .transition(.opacity.combined(with: .scale))
                            .shadow(radius: 10)
                            .zIndex(1)
                    }
                },
                alignment: .top
            )
        }
    }
}
#Preview {
    HomeView()
}
