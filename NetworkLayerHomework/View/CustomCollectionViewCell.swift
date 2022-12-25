//
//  CustomCollectionViewCell.swift
//  NetworkLayerHomework
//
//  Created by Alexander Korchak on 05.12.2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomId"
    
    lazy var episodeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .cyan
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.numberOfLines = 0
        return label
    }()
    
    lazy var seasonLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .cyan
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.numberOfLines = 0
        return label
    }()
    
    lazy var episodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .cyan
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.numberOfLines = 0
        return label
    }()
    
    lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .cyan
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.numberOfLines = 0
        return label
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()
        setupCellContent()
    }
    
    private func setupCell() {
        self.backgroundColor = .systemBlue
        self.layer.cornerRadius = 5
    }
    
    private func setupCellContent() {
        self.contentView.addSubview(episodeImage)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(seasonLabel)
        self.contentView.addSubview(episodeLabel)
        self.contentView.addSubview(ratingLabel)
        
        NSLayoutConstraint.activate([
            
            episodeImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            episodeImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            episodeImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -120),
            episodeImage.bottomAnchor.constraint(equalTo: nameLabel.topAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: episodeImage.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            seasonLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            seasonLabel.leadingAnchor.constraint(equalTo: episodeImage.trailingAnchor, constant: 10),
            seasonLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            seasonLabel.heightAnchor.constraint(equalToConstant: 35),
            
            episodeLabel.topAnchor.constraint(equalTo: seasonLabel.bottomAnchor, constant: 6),
            episodeLabel.leadingAnchor.constraint(equalTo: episodeImage.trailingAnchor, constant: 10),
            episodeLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            episodeLabel.heightAnchor.constraint(equalToConstant: 35),
            
            ratingLabel.topAnchor.constraint(equalTo: episodeLabel.bottomAnchor, constant: 6),
            ratingLabel.leadingAnchor.constraint(equalTo: episodeImage.trailingAnchor, constant: 10),
            ratingLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            ratingLabel.heightAnchor.constraint(equalToConstant: 35)
            
        ])
    }
}
