//
//  MovieListBuilder.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 13.10.2024.
//

import Foundation

final class MovieListBuilder {
    static func make() -> MovieListViewController {
        let viewController = MovieListViewController()
        let service = NetworkService.shared
        let viewModel: MovieListViewModelProtocol = MovieListViewModel(view: viewController, service: service)
        viewController.viewModel = viewModel
        viewController.title = "Movie List"
        return viewController
    }
}
