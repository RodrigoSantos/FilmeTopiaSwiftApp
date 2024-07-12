//
//  Movie.swift
//  Cinematopia
//
//  Created by Rodrigo Oliveira on 17/06/24.
//

import Foundation

class Movie : Decodable {
    let id : Int
    let title : String
    let image : String
    let synopsis : String
    let rate : Double
    let releaseDate : String
    private(set) var isSelected : Bool? = false
    
    //MARK - Class Methods
    
    func changeSelectionStatus(){
        isSelected = !(isSelected ?? false)
    }   
    
}


/*let movies : [Movie] = [
    Movie(id: 1, title: "Avatar", image: "https://github.com/alura-cursos/movie-api/blob/main/images/avatar.jpg?raw=true", synopsis: "Filme dirigido por Jamers Cameron. Teve varios recordes de bilheteria. Fala sobre a exploração do mundo de Pandora e como os habitantes nativos tentam se proteger da exploração dos recursos", rate: 9.1, releaseDate: "12/01/2024"),
    Movie(id: 2, title: "Harry Potter a Camera secreta", image: "https://github.com/alura-cursos/movie-api/blob/main/images/avatar.jpg?raw=true", synopsis: "Um dos maiores best sellers da J.K Rolling produzido pela Warner conta a Historia de um bruxinho que cresce em um mundo onde a magia não era possível, até agora !!!", rate: 9.2, releaseDate: "02/04/2020"),
    Movie(id: 3, title: "Vingadores : Ultimato parte 2", image: "https://github.com/alura-cursos/movie-api/blob/main/images/avatar.jpg?raw=true", synopsis: "Série dos quadrinhos que saiu em Movie Action e encantou o mundo com seus herois estraordinários. Salvando mundos e Galáxias.", rate: 9.8, releaseDate: "14/06/2022")
]
*/
