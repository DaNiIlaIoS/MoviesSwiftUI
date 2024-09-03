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
    
    func getMovies(completion: @escaping (Result<[Movie], Error>) -> ()) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/movie/popular"
        urlComponents.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        
        guard let url = urlComponents.url else { return }

        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                
            } else if let data = data {
//                let json = try? JSONSerialization.jsonObject(with: data)
//                print(json ?? "null")
                
                do {
                    let model = try JSONDecoder().decode(MovieList.self, from: data)
                    completion(.success(model.results))
                } catch {
                    completion(.failure(error))
                }
            }
            
        }.resume()
    }
    
    
}
