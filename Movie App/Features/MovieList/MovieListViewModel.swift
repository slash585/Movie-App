//
//  MovieListViewModel.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 13.10.2024.
//

import Foundation

protocol MovieListViewModelProtocol {
    var movies: Movie? { get set }
    
    func viewDidLoad()
}

final class MovieListViewModel: MovieListViewModelProtocol {
    
    private weak var view: MovieListViewControllerProtocol?
    
    let service: NetworkServiceProtocol?
    
    var movies: Movie?
    
    init(view: MovieListViewControllerProtocol?, service: NetworkServiceProtocol?) {
        self.view = view
        self.service = service
    }
    
    func viewDidLoad() {
        fetchMovies()
    }
}

extension MovieListViewModel {
    private func fetchMovies() {
        service?.fetch(.popular, completion: { [weak self] (result: (Result<Movie, Error>)) in
            
            guard let self else { return }
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.movies = data
                    self.view?.prepareCollectionView()
                }
            case .failure(let error):
                print(error)
            }
        })
    }
}
