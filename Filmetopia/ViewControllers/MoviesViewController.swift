//
//  MoviesViewController.swift
//  Cinematopia
//
//  Created by Rodrigo Oliveira on 06/06/24.
//

import UIKit
// UITableViewDataSource cuida da conte de dados de uma tabela, UITabBarDelegate responsavel pelo comportamento
class MoviesViewController: UIViewController {
    
    private let _identificador = "moviesCell"
    private var _filterMovie: [Movie] = []
    private var _isSearchBarActivate : Bool = false
    //private var _movieService: MovieServiceUsingClosure = MovieServiceUsingClosure()
    private var _movieService: MovieServicesAsyncWait = MovieServicesAsyncWait()
    
    private var movies: [Movie] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self // UITableViewDataSourse
        tableView.delegate = self // protocolo UITAbleViewDelegate
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: _identificador)
        tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: _identificador)
        
        return tableView
    }()
    
    private lazy var _searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Pesquisa"
        //searchBar.backgroundColor = .white // todo contorno do componente
        searchBar.searchTextField.backgroundColor = .white //Apenas o campo da pesquisa
        searchBar.delegate = self // Todos os componentes delagate precisam do self
        
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        SetupNavegationViewController()
        AddSubView()
        SetupConstrants()
        Task{
          await FetchMovies()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    private func AddSubView(){
        view.addSubview(tableView)
    }
    
    private func FetchMovies() async {
        
        //aguarda até receber as informações
        do {
            movies = try await _movieService.getMovies()
            tableView.reloadData()
        } catch {
            print(error)
        }
        
        
    }
    //Versão sincrona usando clouser
    /*private func FetchMovies(){
        _movieService.getMovies { result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.sync {
                    self.movies = movies
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }*/
    
    private func SetupConstrants(){
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func SetupNavegationViewController(){
        
        title = "Filmes populares"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [ //tambem pode ser usado o titletextAtribut
            NSAttributedString.Key.foregroundColor: UIColor(.white)
        ]
        navigationItem.setHidesBackButton(true, animated: true)//apaga botão de voltar
        navigationItem.titleView = _searchBar
    }
}


extension MoviesViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _isSearchBarActivate ? _filterMovie.count :  movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TableView vem por parametro assim como o indexpath que tem as informacoes da celula
        if let cell = tableView.dequeueReusableCell(withIdentifier: _identificador, for: indexPath) as? MoviesTableViewCell {
            
            let movie = _isSearchBarActivate ? _filterMovie[indexPath.row] : movies[indexPath.row]
            cell.ConfigureCell(movie: movie )// Passa a celula os filmesconforme o index da lista
            cell.selectionStyle = .none
            cell.delegate = self// Aqui é onde contecta a moviesTableViewCell com está classe
            return cell
        }
        //var configuration = cell.defaultContentConfiguration()
        //configuration.textProperties.color = .white
        // configuration.text = movies[indexPath.row].title // aqui vai passar o indexPth para cada linha da minha lista de nomes
        //cell.contentConfiguration = configuration
        //cell.backgroundColor = .clear
        
        return UITableViewCell() // Caso não retorne nada
    }
    //didiSel responsavel por realizar a ação do click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at:indexPath, animated: true)
        let movie = _isSearchBarActivate ? _filterMovie[indexPath.row] : movies[indexPath.row]
        let detailsVS = MovieDetailsViewController(movie: movie)
        
        navigationController?.pushViewController(detailsVS, animated: true)
        
    }
    // Retorno Altura da minha celula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}


extension MoviesViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            _isSearchBarActivate = false
        }
        else {
            _isSearchBarActivate = true
            _filterMovie = movies.filter({
                movie in movie.title.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
}
//Implementacao do protocolo MovieTableViewCellDelegate
extension MoviesViewController : MovieTableViewCellDelegate{
    func didSelectFavoriteButton(sender: UIButton) {
        //recupero a cell através do sender
        
        guard let cell = sender.superview?.superview as? MoviesTableViewCell else {
            return
        }
        //descobrir o indice da celula que foi enviada
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        let selectMovie = movies[indexPath.row] // Pega o filme na linha que o usuário clicou
        selectMovie.changeSelectionStatus()
        MovieManeger.shared.add(selectMovie)
        
        //reload somente a celula
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        // tableView.reloadData() recareggaria toda tabela
    }
}
