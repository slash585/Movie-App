//
//  ViewController.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 13.10.2024.
//

import UIKit
import SnapKit

protocol MovieListViewControllerProtocol: AnyObject {
    func prepareCollectionView()
}

final class MovieListViewController: UIViewController {

    var viewModel: MovieListViewModelProtocol?
    
    private lazy var collectionView: UICollectionView = {
        // Layout oluşturma
        let layout = UICollectionViewFlowLayout()
        let itemSpacing: CGFloat = 10
        let itemsPerRow: CGFloat = 2
        let padding: CGFloat = 20

        let totalSpacing = itemSpacing * (itemsPerRow - 1) + padding * 2
        let itemWidth = (view.frame.width - totalSpacing) / itemsPerRow

        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.minimumInteritemSpacing = itemSpacing
        layout.minimumLineSpacing = itemSpacing

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white

        collectionView.register(MovieListCollectionViewCell.self, forCellWithReuseIdentifier: MovieListCollectionViewCell.reuseID)

        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
        configureUI()
    }
}

extension MovieListViewController {
    private func configureUI() {
        view.backgroundColor = .white
    }
}

extension MovieListViewController: MovieListViewControllerProtocol {
    func prepareCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }
}

extension MovieListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.movies?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieListCollectionViewCell.reuseID, for: indexPath) as! MovieListCollectionViewCell
        guard let movie = viewModel?.movies?.results[indexPath.item] else { return cell }
        cell.configure(movie: movie)
        return cell
    }
}

