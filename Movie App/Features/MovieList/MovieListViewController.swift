//
//  ViewController.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 13.10.2024.
//

import UIKit

protocol MovieListViewControllerProtocol: AnyObject {}

final class MovieListViewController: UIViewController {

    var viewModel: MovieListViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
    }
}

extension MovieListViewController: MovieListViewControllerProtocol {}

