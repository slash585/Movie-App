//
//  ViewController.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 13.10.2024.
//

import UIKit

protocol MovieListViewControllerProtocol: AnyObject {
    func prepareCollectionView()
}

final class MovieListViewController: UIViewController {

    var viewModel: MovieListViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension MovieListViewController: MovieListViewControllerProtocol {
    func prepareCollectionView() {
        print(viewModel?.movies)
    }
}

