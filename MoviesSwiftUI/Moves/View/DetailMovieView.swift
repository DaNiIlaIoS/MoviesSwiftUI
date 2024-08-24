//
//  DetailMovieView.swift
//  MoviesSwiftUI
//
//  Created by Даниил Сивожелезов on 23.08.2024.
//

import SwiftUI

struct DetailMovieView: View {
    let movie: Movie

    var body: some View {
        VStack {
            
        }
        .onAppear {
            print(movie.title)
        }
    }
}
