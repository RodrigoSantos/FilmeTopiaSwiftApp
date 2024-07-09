//
//  FavoriteMoviesViewController.swift
//  Filmetopia
//
//  Created by Rodrigo Oliveira on 04/07/24.
//

import UIKit

class FavoriteMovieCollectionViewCell: UICollectionViewCell {
    //MARK: - Componentes
       
    private lazy var moviePosterImageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        
        return image
    }()
    
    private lazy var tituloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "Avatar"
        label.textColor = .white
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        
        return label
            
    }()
    
    private lazy var botaoFavorito: UIButton = {
       let botao = UIButton()
        botao.translatesAutoresizingMaskIntoConstraints = false
        let iconImage = UIImage(systemName: "heart.fill")?.withTintColor(.buttonBackGround,renderingMode: .alwaysOriginal)
        
        botao.setImage(iconImage, for: .normal)
        botao.addTarget(self, action: #selector(didTapBotaoFavorito), for: .touchUpInside)
        
        return botao
    }()
    
    
    //MARK: - View Life Cyrcle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = .lightGray
        
        addSubView()
        setupConstrants()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: - Class Methods
    private func addSubView(){
        addSubview(moviePosterImageView)
        addSubview(tituloLabel)
        addSubview(botaoFavorito)
    }
    
    private func setupConstrants(){
        NSLayoutConstraint.activate([
                        
            moviePosterImageView.topAnchor.constraint(equalTo: topAnchor),
            moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            moviePosterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 140),
            
            tituloLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 12 ),
            tituloLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.leadingAnchor),
            tituloLabel.trailingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor),
            
            botaoFavorito.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor,constant: 3),
            botaoFavorito.widthAnchor.constraint(equalToConstant: 25),
            botaoFavorito.heightAnchor.constraint(equalToConstant: 25),
            botaoFavorito.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
        }
    
    func setupView(_ movie: Movie){
        let url = URL(string: movie.image)
        moviePosterImageView.kf.setImage(with: url)
        tituloLabel.text = movie.title
    }
    
    @objc func didTapBotaoFavorito(_ sender: UIButton){
        botaoFavorito.tintColor = .white
        print("teste")
    }
}
