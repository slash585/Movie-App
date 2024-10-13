//
//  AppBuilder.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 13.10.2024.
//

import Foundation
import UIKit

final class AppBuilder {
    static func make () -> UIViewController {
        let viewController = MovieListViewController()
        let viewModel: MovieListViewModelProtocol = MovieListViewModel(view: viewController)
        viewController.viewModel = viewModel
        viewController.title = "Movie List"
        return viewController
    }
}
