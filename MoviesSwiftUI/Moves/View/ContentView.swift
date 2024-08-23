//
//  ContentView.swift
//  MoviesSwiftUI
//
//  Created by Даниил Сивожелезов on 21.08.2024.
//

import SwiftUI

struct ContentView: View {
    private let columns: [GridItem] = [GridItem(.flexible())]
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.movies, id: \.title) { movie in
                        NavigationLink {
                            DetailMovieView()
                        } label: {
                            MovieCellView(movie: movie)
                                .tint(.black)
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .frame(height: 200)
                    .background(Color(.systemGray4))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .clipShape(.rect(cornerRadius: 10))
                }
                .padding(.horizontal, 10)
            }
            .onAppear {
                viewModel.getMovies()
            }
        }
    }
}

#Preview {
    ContentView()
}
