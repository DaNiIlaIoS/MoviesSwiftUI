//
//  PopularMovies.swift
//  MoviesSwiftUI
//
//  Created by Даниил Сивожелезов on 23.08.2024.
//

import Foundation

struct PopularMovies: Decodable {
    let page: Int
    let results: [Movie]
}
