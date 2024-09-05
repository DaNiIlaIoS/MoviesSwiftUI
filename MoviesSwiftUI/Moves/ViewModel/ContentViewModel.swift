//
//  ContentViewModel.swift
//  MoviesSwiftUI
//
//  Created by Даниил Сивожелезов on 23.08.2024.
//

import Foundation

@MainActor
final class ContentViewModel: ObservableObject {
    private let networkManager = NetworkManager()
    @Published var movies: [Movie] = []
    
    func getMovies() {
        Task {
            do {
                movies = try await networkManager.getMovies()
            } catch {
                print("Failed to load movies: \(error.localizedDescription)")
            }
        }
    }
}
