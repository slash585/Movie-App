//
//  MovieListViewModel.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 13.10.2024.
//

import Foundation

protocol MovieListViewModelProtocol {
    func viewDidLoad()
}

final class MovieListViewModel: MovieListViewModelProtocol {
    
    private weak var view: MovieListViewControllerProtocol?
    
    init(view: MovieListViewControllerProtocol?) {
        self.view = view
    }
    
    func viewDidLoad() {
        print("im here !!")
    }
}
