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
    // MARK: - UI Components
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 27, bottom: 10, right: 27)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(FavoriteMovieCollectionViewCell.self, forCellWithReuseIdentifier: cellRegister)
        collectionView.register(FavoriteCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cellRegisterReusable)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = .background
        setupConstraints()
    }
    
    //Para atualizar toda vez que entra nos favoritos
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    // MARK: - Class methods
    
    private func setupConstraints() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension FavoriteMoviesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieManeger.shared.favoritesMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellRegister, for: indexPath) as? FavoriteMovieCollectionViewCell else {
            fatalError("error to create FavoriteMovieCollectionViewCell")
        }
        
        let currentMovie = MovieManeger.shared.favoritesMovies[indexPath.item]
        cell.setupView(currentMovie)
        cell.delegate = self //Conexão com a viewControler e a celula
        
        
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

extension FavoriteMoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
}

extension FavoriteMoviesViewController: FavoriteMovieCollectionViewCellDelegate {
    func didSelectFavoritButton(sender: UIButton) {
        print("Deu boas")
    }
    
    
    
}

/*
#Preview {
    
    FavoriteMoviesViewController()
}*/

