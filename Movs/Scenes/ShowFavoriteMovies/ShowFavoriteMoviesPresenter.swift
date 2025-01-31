//
//  ShowFavoriteMoviesPresenter.swift
//  Movs
//
//  Created by Miguel Pimentel on 22/09/19.
//  Copyright (c) 2019 Miguel Pimentel. All rights reserved.
//

import UIKit

protocol ShowFavoriteMoviesPresentationLogic {
    func presentFavoriteMovies(response: ShowFavoriteMovies.FetchFavoriteMovies.Response)
    func presentUpdatedFavoriteMovies(response: ShowFavoriteMovies.UnfavoriteMovie.Response)
}

class ShowFavoriteMoviesPresenter: ShowFavoriteMoviesPresentationLogic {
    
    weak var viewController: ShowFavoriteMoviesDisplayLogic?

    func presentFavoriteMovies(response: ShowFavoriteMovies.FetchFavoriteMovies.Response) {
        if let content = response.content {
            let viewModel = ShowFavoriteMovies.FetchFavoriteMovies.ViewModel(content: content)
            viewController?.displayFavoriteMovies(viewModel: viewModel)
        }
    }
    
    func presentUpdatedFavoriteMovies(response: ShowFavoriteMovies.UnfavoriteMovie.Response) {
        if let content = response.content {
            let viewModel = ShowFavoriteMovies.UnfavoriteMovie.ViewModel(content: content)
            viewController?.displayUpdatedFavoriteMovies(viewModel: viewModel)
        }
    }
}
