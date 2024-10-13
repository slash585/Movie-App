//
//  MovieDetailViewController.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 13.10.2024.
//

import UIKit

protocol MovieDetailViewControllerProtocol: AnyObject {}

final class MovieDetailViewController: UIViewController {
    
    var viewModel: MovieDetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension MovieDetailViewController: MovieDetailViewControllerProtocol {}
