//
//  Movie.swift
//  MoviesSwiftUI
//
//  Created by Даниил Сивожелезов on 22.08.2024.
//

import Foundation

struct Movie: Decodable {
    let id: Int?
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
