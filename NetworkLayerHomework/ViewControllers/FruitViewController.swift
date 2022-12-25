//
//  ViewController.swift
//  NetworkLayerHomework
//
//  Created by Alexander Korchak on 03.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let network: NetworkLayer = URLSessionLayer()
    
    var myFruits: [FruitDatum] = []
    
    private lazy var table: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.delegate = self
        table.dataSource = self
        table.register(CustomTableCell.self, forCellReuseIdentifier: CustomTableCell.cellId)
        table.backgroundColor = .white
        table.layer.cornerRadius = 10
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Fruits"
        setupTableView()
        
        network.getAllFruits { [weak self] result in
            DispatchQueue.main.async {
                do {
                    self?.myFruits = try result.get()
                } catch let error as NSError {
                    print(error)
                }
                self?.table.reloadData()
            }
        }
    }
    
    private func setupTableView() {
        self.view.addSubview(table)
       
        NSLayoutConstraint.activate([
            
            table.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            table.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            table.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myFruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableCell.cellId, for: indexPath) as? CustomTableCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            return cell
        }
        if let fruitName = myFruits[indexPath.row].name,
           let fruitGenus = myFruits[indexPath.row].genus,
           let fruitNutritions = myFruits[indexPath.row].nutritions?.calories,
           let fruitSugar = myFruits[indexPath.row].nutritions?.sugar {
            cell.genusLabel.text = "Genus: \(fruitGenus)"
            cell.nameLabel.text = "Name: \(fruitName)"
            cell.caloriesLabel.text = "Calories: \(String(fruitNutritions))"
            cell.sugarLabel.text = "Sugar: \(String(fruitSugar))"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}

