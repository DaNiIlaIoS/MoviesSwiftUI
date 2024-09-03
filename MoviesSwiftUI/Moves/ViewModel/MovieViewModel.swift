//
//  DetailViewModel.swift
//  MoviesSwiftUI
//
//  Created by Даниил Сивожелезов on 03.09.2024.
//

import Foundation

final class MovieViewModel: ObservableObject {
    private let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var title: String {
        movie.title
    }
    
    var releaseDate: String {
        movie.releaseDate
    }
    
    var voteAverage: String {
        String(format: "%.1f", movie.voteAverage)
    }
    
    var posterURL: URL? {
        URL(string: "https://image.tmdb.org/t/p/w500" + "\(movie.posterPath)")
    }
    
    var overview: String {
        movie.overview
    }
}
