//
//  ContentViewModel.swift
//  MoviesSwiftUI
//
//  Created by Даниил Сивожелезов on 23.08.2024.
//

import Foundation

final class ContentViewModel: ObservableObject {
    private let networkManager = NetworkManager()
    @Published var movies: [Movie] = []
    
    func getMovies() {
        networkManager.getMovies { [weak self] result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self?.movies = movies
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
