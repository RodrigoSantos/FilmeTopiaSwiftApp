//
//  File.swift
//  Filmetopia
//
//  Created by Rodrigo Oliveira on 12/07/24.
//

import Foundation

class MovieManeger{
    
    // MARK: Atributos
    
    static let shared = MovieManeger()
    var favoritesMovies: [Movie] = []
    //MARK : - init
    
    private init() {}
    
    //MARK: - Class Methods
    
    func add(_ movie: Movie) {
        if favoritesMovies.contains(where: { $0.id == movie.id }) {
            remove(movie)
        } else {
            favoritesMovies.append(movie)
        }
    }
    
    func remove(_ movie: Movie) {
        if let index = favoritesMovies.firstIndex(where: { $0.id == movie.id }) {
            favoritesMovies.remove(at: index)
        }
    }
}
