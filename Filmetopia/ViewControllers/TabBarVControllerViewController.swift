//
//  TabBarVControllerViewController.swift
//  Filmetopia
//
//  Created by Rodrigo Oliveira on 11/07/24.
//

import UIKit

class TabBarVControllerViewController: UITabBarController {

    //MARK - View life cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBarViewController()
    }
    
    //MARK - Class Methods
    private func setupTabBarViewController() {
        let home = UINavigationController(rootViewController: MoviesViewController())
        let symbolConfiguration = UIImage.SymbolConfiguration(scale: .medium)
        
        let homeSymbol = UIImage(systemName: "film", withConfiguration: symbolConfiguration)
        home.tabBarItem.image = homeSymbol
        home.tabBarItem.title = "Filmes Populares"
        
        
        let favoritos = UINavigationController(rootViewController: FavoriteMoviesViewController())
        let heartSymbol = UIImage(systemName: "heart", withConfiguration: symbolConfiguration)
        favoritos.tabBarItem.image = heartSymbol
        favoritos.tabBarItem.title = "Favoritos"
        
        self.setViewControllers([home, favoritos], animated: true)
        
        
    }
}
