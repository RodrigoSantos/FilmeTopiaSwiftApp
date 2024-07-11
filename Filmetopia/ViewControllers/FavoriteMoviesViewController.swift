//
//  FavoriteMoviesViewController.swift
//  Filmetopia
//
//  Created by Rodrigo Oliveira on 04/07/24.
//

import UIKit

class FavoriteMoviesViewController: UIViewController {
    
    // MARK: - Componentes
    private let cellRegister: String = "FavoriteMovieCollectionViewCell"
    private let cellRegisterReusable: String =  "FavoriteCollectionReusableView"
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 27, bottom: 10, right: 27)//Ajusta celula  nova
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //collectionView.backgroundColor = .yellow
        collectionView.backgroundColor = .clear // TRasparente
        collectionView.register(FavoriteMovieCollectionViewCell.self, forCellWithReuseIdentifier: cellRegister)
        collectionView.register(FavoriteCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cellRegisterReusable)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    // MARK: - View life Cyrcle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setupConstranints()
        view.backgroundColor = .background
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Class Methods
    private func addSubView(){
        view.addSubview(collectionView)
    }
    
    private func setupConstranints(){
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension FavoriteMoviesViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellRegister, for: indexPath) as? FavoriteMovieCollectionViewCell else { fatalError("Erro ao retotnar FavoriteMovieCollectionViewCell")}
        
        let currentMovie = movies[indexPath.item]
        cell.setupView(currentMovie)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cellRegisterReusable, for: indexPath) as? FavoriteCollectionReusableView else {
                fatalError("error to create collectionview header")
            }
            
            headerView.setupTitle("Meus filmes favoritos")
            
            
            return headerView
        }
        
        return UICollectionReusableView()
    }
    
}
//Protocolo responsável por determinar o tamanho e da minha coleção
extension FavoriteMoviesViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tamanhoDaColecaoDivididoPorColumas = collectionView.frame.width/3
        // Largura não pode ser fixo pois pode mudar o tamanho do dispositivo
        return CGSize(width: tamanhoDaColecaoDivididoPorColumas, height: 200)
    }
    
    //Formata o título no header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
}


#Preview {
    
    FavoriteMoviesViewController()
}

