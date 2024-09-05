//
//  MovieCellView.swift
//  MoviesSwiftUI
//
//  Created by Даниил Сивожелезов on 23.08.2024.
//

import SwiftUI

struct MovieCellView: View {
    @ObservedObject var viewModel: MovieViewModel
    private let height: CGFloat = 240
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    AsyncImage(url: viewModel.posterURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: height)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(width: geometry.size.width, height: height)
                    }
                    
                    VStack {
                        Text(viewModel.voteAverage)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .font(.system(size: 19, weight: .bold))
                            .foregroundStyle(.white)
                            .background(.movieAverage)
                    }
                    .padding()
                }
                
                VStack(alignment: .leading) {
                    Text(viewModel.title)
                        .font(.system(size: 20, weight: .bold))
                }
                .multilineTextAlignment(.leading)
            }
        }
    }
}

