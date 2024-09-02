//
//  MovieCellView.swift
//  MoviesSwiftUI
//
//  Created by Даниил Сивожелезов on 23.08.2024.
//

import SwiftUI

struct MovieCellView: View {
    let movie: Movie
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + "\(movie.posterPath)")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: 240)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(width: geometry.size.width, height: 240)
                    }
                    
                    VStack {
                        Text(String(format: "%.1f", movie.voteAverage))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .font(.system(size: 19, weight: .bold))
                            .foregroundStyle(.white)
                            .background(.movieAverage)
                    }
                    .padding()
                }
                
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.system(size: 20, weight: .bold))
                }
                .multilineTextAlignment(.leading)
            }
        }
    }
}

