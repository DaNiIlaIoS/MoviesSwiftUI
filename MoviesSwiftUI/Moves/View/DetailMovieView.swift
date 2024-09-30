//
//  DetailMovieView.swift
//  MoviesSwiftUI
//
//  Created by Даниил Сивожелезов on 23.08.2024.
//

import SwiftUI

struct DetailMovieView: View {
    @ObservedObject var viewModel: MovieViewModel
    private let posterWidth = UIScreen.main.bounds.width * 0.55
    
    var body: some View {
        VStack {
            VStack(spacing: 15) {
                VStack(spacing: 10) {
                    AsyncImage(url: viewModel.posterURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: posterWidth, height: posterWidth * 1.5)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(width: posterWidth, height: posterWidth * 1.5)
                    }
                    Text(viewModel.title)
                        .font(.system(size: 22, weight: .black))
                    HStack {
                        Text(viewModel.releaseDate)
                            .foregroundStyle(.gray)
                        Text(viewModel.voteAverage)
                            .foregroundStyle(.movieAverage)
                            .font(.system(size: 14, weight: .black))
                    }
                    .font(.system(size: 14))
                    
                }
                
                Text(viewModel.overview)
                    .font(.system(size: 19, weight: .light))
                    .multilineTextAlignment(.center)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

//struct YouTubeView: UIViewControllerRepresentable {
//    let link: String
//
//    func makeUIViewController(context: Context) -> YouTubePlayerViewController {
//        let ytPlayer = YouTubePlayerViewController()
//        ytPlayer.player.source = .url(link)
//        ytPlayer.player.configuration = YouTubePlayer.Configuration(
//            autoPlay: false,
//            showCaptions: false,
//            showAnnotations: false,
//            showRelatedVideos: false
//        )
//        return ytPlayer
//    }
//
//    func updateUIViewController(_ ytPlayer: YouTubePlayerViewController, context: Context) {
//        ytPlayer.player.source = .url(link)
//    }
//}
