//
//  PictureViewController.swift
//  NetworkLayerHomework
//
//  Created by Alexander Korchak on 03.12.2022.
//

import UIKit

class QuoteViewController: UIViewController {
    
    private let network: NetworkLayer = URLSessionLayer()
    var quotesFromNet: [CustomQuote] = []
    
    private lazy var quoteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.cornerRadius = 6
        label.textColor = .white
        label.backgroundColor = .systemGreen
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var getRandomNumberButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get quote", for: .normal)
        button.addTarget(self, action: #selector(getNumber), for: .touchUpInside)
        return button
    }()
    
    @objc private func getNumber() {
        let randomNumber = Int.random(in: 0...quotesFromNet.count - 1)
        quoteLabel.text = quotesFromNet[randomNumber].title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Quotes"
        
        setLabel()
        setButton()
        
        network.getQuote { [weak self] result in
            DispatchQueue.main.async {
                do {
                    self?.quotesFromNet = try result.get()
                } catch  {
                    print("Error")
                }
            }
        }
    }
    
    private func setLabel() {
        self.view.addSubview(quoteLabel)
        
        NSLayoutConstraint.activate([
            quoteLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 200),
            quoteLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            quoteLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            quoteLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            quoteLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setButton() {
        self.view.addSubview(getRandomNumberButton)
        
        NSLayoutConstraint.activate([
            
            getRandomNumberButton.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 30),
            getRandomNumberButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            getRandomNumberButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            getRandomNumberButton.heightAnchor.constraint(equalToConstant: 80)
            
        ])
    }
}
