//
//  ContentView.swift
//  MoviesSwiftUI
//
//  Created by Даниил Сивожелезов on 21.08.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    private let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.movies, id: \.title) { movie in
                        NavigationLink {
                            DetailMovieView(viewModel: MovieViewModel(movie: movie))
                                .navigationTitle("Movie Details")
                        } label: {
                            MovieCellView(viewModel: MovieViewModel(movie: movie))
                                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .frame(height: 320)
                    .background(Color(.systemGray5))
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
