//
//  SearchMoviesWorker.swift
//  Rappi
//
//  Created by Miguel Pimentel on 24/09/19.
//  Copyright (c) 2019 Miguel Pimentel. All rights reserved.
//

import UIKit

class SearchMoviesWorker {
    
    private let networkManager = NetworkManager()

    private let moviesManager = MovieManager()
    private let genreManager = GenreManager()
   
    func getGenres(completion: @escaping ([Genre]?) -> Void) {
        networkManager.request(type: GenreResponse.self,
                               service: GenreEndpoint.getGenres) { [unowned self] response in
            switch response {
                case let .success(result):
                    completion(result.genres)
                case .failure(_):
                    let genres = self.genreManager.getAll()
                    completion(genres)
            }
        }
    }
    
    func getMovies(by genreId: Int, page: Int, completion: @escaping ([Movie]?) -> Void) {
        networkManager.request(type: MoviesResponse.self,
                               service: MovieEndpoint.getByGenre(genreId: genreId, page: page)) { [unowned self] response in
            switch response {
                case let .success(result):
                    completion(result.results)
                case .failure(_):
                    let movies = self.moviesManager.getByGenre(genreId: genreId)
                    completion(movies)
            }
        }
    }
}
