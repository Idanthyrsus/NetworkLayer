//
//  MovieViewController.swift
//  NetworkLayerHomework
//
//  Created by Alexander Korchak on 04.12.2022.
//

import UIKit

class MovieViewController: UIViewController {
    
    let network: NetworkLayer = URLSessionLayer()
    
    var episodes: [MovieDatum] = []
    
    private lazy var episodesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.width - 50, height: 180)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
    
        return collection
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Movie"
        
        setupCollection()
        
        network.getEpisode { [weak self] result in
            DispatchQueue.main.async {
                do {
                    self?.episodes = try result.get()
                } catch  {
                    print(error)
                }
                self?.episodesCollection.reloadData()
            }
        }
    }
    
    private func setupCollection() {
        self.view.addSubview(episodesCollection)
        
        NSLayoutConstraint.activate([
        
            episodesCollection.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            episodesCollection.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            episodesCollection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            episodesCollection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            
        ])
    }
}

extension MovieViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        episodes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }
        
        cell.nameLabel.text = episodes[indexPath.row].name
        if let season = episodes[indexPath.row].season,
        let episode = episodes[indexPath.row].episode,
           let rating = episodes[indexPath.row].rating {
            cell.seasonLabel.text = "Season: \(String(season))"
            cell.episodeLabel.text = "Episode: \(String(episode))"
            cell.ratingLabel.text = "Rating: \(String(rating))"
        }
  
        if let url = URL(string: episodes[indexPath.row].thumbnailURL ?? "") {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        cell.episodeImage.image = UIImage(data: data)
                    }
                }
            }
        }
         
        return cell
    }
}
