//
//  DetailMovieView.swift
//  MoviesSwiftUI
//
//  Created by Даниил Сивожелезов on 23.08.2024.
//

import SwiftUI
import YouTubePlayerKit

struct DetailMovieView: View {
    let movie: Movie
    private let posterWidth = UIScreen.main.bounds.width * 0.55
    
    var body: some View {
        VStack {
            VStack(spacing: 15) {
                VStack(spacing: 10) {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + "\(movie.posterPath)")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: posterWidth, height: posterWidth * 1.5)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(width: posterWidth, height: posterWidth * 1.5)
                    }
                    Text(movie.title)
                        .font(.system(size: 22, weight: .black))
                    HStack {
                        Text(movie.releaseDate)
                            .foregroundStyle(.gray)
                        Text(String(format: "%.1f", movie.voteAverage))
                            .foregroundStyle(.movieAverage)
                    }
                    .font(.system(size: 14))
                    
                }
                
                Text(movie.overview)
                    .font(.system(size: 19, weight: .light))
                    .multilineTextAlignment(.center)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
