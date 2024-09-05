//
//  NetworkManager.swift
//  MoviesSwiftUI
//
//  Created by Даниил Сивожелезов on 22.08.2024.
//

import Foundation

final class NetworkManager {
    private let apiKey = "fb206090c748694f4842022ed2f3c1c8"
    let imageServerAdress = "https://image.tmdb.org/t/p/w500"
    
    func getMovies() async throws -> [Movie] {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/movie/popular"
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "page", value: "1")
        ]
        
        guard let url = urlComponents.url else { throw NetworkError.invalidURL }

        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoder = try JSONDecoder().decode(MovieList.self, from: data)
            return decoder.results
        } catch {
            throw error
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
}
