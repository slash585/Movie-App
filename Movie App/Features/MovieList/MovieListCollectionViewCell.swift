//
//  MovieListCollectionViewCell.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 13.10.2024.
//

import UIKit
import SnapKit
import Kingfisher

class MovieListCollectionViewCell: UICollectionViewCell {
    static let reuseID = "MovieListCollectionViewCell"
    
    private var movie: MovieResult?
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor = .label
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(movie: MovieResult) {
        self.movie = movie
    }
}

extension MovieListCollectionViewCell {
    private func configureUI() {
        makeImageView()
        makeTitleLabel()
    }
    
    private func makeImageView() {
        DispatchQueue.main.async {
            self.contentView.addSubview(self.posterImageView)
            
            guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(self.movie?.posterPath ?? "")" ) else { return }
            self.posterImageView.kf.setImage(with: url)
            self.posterImageView.snp.makeConstraints { make in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(self.contentView.snp.height).multipliedBy(0.80)
            }
        }
    }
    
    private func makeTitleLabel() {
        DispatchQueue.main.async {
            self.contentView.addSubview(self.titleLabel)
            self.titleLabel.text = self.movie?.originalTitle ?? ""
            self.titleLabel.snp.makeConstraints { make in
                make.left.right.bottom.equalToSuperview()
            }
        }
    }
}
