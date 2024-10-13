//
//  MovieDetailBuilder.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 13.10.2024.
//

import Foundation

final class MovieDetailBuilder {
    static func make(movie: MovieResult) -> MovieDetailViewController {
        let viewController = MovieDetailViewController()
        let viewModel: MovieDetailViewModelProtocol = MovieDetailViewModel(view: viewController, movie: movie)
        viewController.viewModel = viewModel
        viewController.title = movie.originalTitle
        return viewController
    }
}
