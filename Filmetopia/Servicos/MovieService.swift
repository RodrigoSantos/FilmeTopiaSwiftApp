//
//  MovieServices.swift
//  Cinematopia
//
//  Created by Rodrigo Oliveira on 20/06/24.
//

import Foundation

enum MovieServiceError: Error {
    case invalidURL
    case invalidResponse
    case decoingError
}

struct MovieServicesAsyncWait{
    
    func getMovies() async throws -> [Movie]{
        let urlString = "https://my-json-server.typicode.com/alura-cursos/movie-api/movies"
        guard let url = URL(string: urlString) else {
            throw MovieServiceError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse  = response as? HTTPURLResponse, httpResponse.statusCode == 200 else
        {
            throw MovieServiceError.invalidResponse
        }
        do {
            let movies = try JSONDecoder().decode([Movie].self, from: data)
            return movies
            
        } catch {
            throw MovieServiceError.decoingError
        }
    }
}


struct MovieServiceUsingClosure{
    func getMovies(completion: @escaping (Result<[Movie], MovieServiceError>) -> Void){//Ponto de interrogação significa que o retorno é opcional
    //func getMovies() -> [Movie]?{//Ponto de interrogação significa que o retorno é opcional
        
        let urlString = "https://my-json-server.typicode.com/alura-cursos/movie-api/movies"
        guard let url = URL(string: urlString) 
            else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
            else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
               let movies = try JSONDecoder().decode([Movie].self, from: data)
                completion(.success(movies))
            } catch (let error) {
                print(error)
                completion(.failure(.decoingError))
            }
        }
        task.resume()
    }
}
