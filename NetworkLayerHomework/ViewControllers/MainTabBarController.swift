//
//  MainTabBarController.swift
//  NetworkLayerHomework
//
//  Created by Alexander Korchak on 03.12.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private lazy var fruitViewController: UINavigationController = {
        let controller = UINavigationController(rootViewController: ViewController())
        controller.tabBarItem.image = UIImage(systemName: "leaf")
        controller.tabBarItem.title = "Fruits"
        controller.navigationBar.prefersLargeTitles = true
 
        return controller
    }()
    
    private lazy var quoteViewController: UINavigationController = {
        let controller = UINavigationController(rootViewController: QuoteViewController())
        controller.tabBarItem.image = UIImage(systemName: "highlighter")
        controller.tabBarItem.title = "Quotes"
        controller.navigationBar.prefersLargeTitles = true
  
        return controller
    }()

    
    private lazy var movieViewController: UINavigationController = {
        let controller = UINavigationController(rootViewController: MovieViewController())
        controller.tabBarItem.image = UIImage(systemName: "camera")
        controller.tabBarItem.title = "Movies"
        controller.navigationBar.prefersLargeTitles = true
     
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = .black
        setViewControllers([fruitViewController, quoteViewController, movieViewController], animated: true)
    }
}
