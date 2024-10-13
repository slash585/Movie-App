//
//  MovieDetailViewModel.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 13.10.2024.
//

import Foundation

protocol MovieDetailViewModelProtocol {
    var movie: MovieResult? { get set }
}

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    private weak var view: MovieDetailViewControllerProtocol?
    
    var movie: MovieResult?
    
    init(view: MovieDetailViewControllerProtocol?, movie: MovieResult?) {
        self.view = view
        self.movie = movie
    }
}
