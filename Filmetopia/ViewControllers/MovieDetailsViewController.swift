//
//  MovieDetailsViewController.swift
//  Cinematopia
//
//  Created by Rodrigo Oliveira on 18/06/24.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController {

    var movie : Movie
    
    /*private lazy var _viewEmBranco : UIView = {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()*/
    
    private lazy var _tituloLabel: UILabel = {
        let label = UILabel()
        label.text = movie.title
        //label.text = "Avatar"
        label.textColor = .white
        label.textAlignment = .center
        //label.backgroundColor = .red
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight:.bold)
        
        return label
    }()
    
    private lazy var _classificacaoLabel: UILabel = {
        let label = UILabel()
        label.text = "Classificação dos usuários : \(movie.rate)"
        //label.text = "9.8"
        label.textColor  = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private lazy var _synopseLabel : UILabel = {
        let label = UILabel()
        label.text = movie.synopsis
        //label.text = "Um dos maiores best sellers da J.K Rolling produzido pela Warner conta a Historia de um bruxinho que cresce em um mundo onde a magia não era possível, até agora !!!"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .white.withAlphaComponent(0.75)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var _capaMovieImagemView : UIImageView = {
        let imagemView = UIImageView()
        let url = URL(string: movie.image)
        imagemView.kf.setImage(with: url)
        //imagemView.image = UIImage(named: movie.image)
        //imagemView.image = UIImage(named: "Avatar")
        //imagemView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        //imagemView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        imagemView.contentMode = .scaleAspectFit
        imagemView.layer.masksToBounds = true
        imagemView.layer.cornerRadius = 32
        //imagemView.backgroundColor = .red
        
        imagemView.translatesAutoresizingMaskIntoConstraints = false
        
        return imagemView
    }()
    
    private func AddSubView(){
        view.addSubview(_tituloLabel)
        view.addSubview(_synopseLabel)
        view.addSubview(_classificacaoLabel)
        view.addSubview(_capaMovieImagemView)
        //view.addSubview(_viewEmBranco)
    }
    
    private func SetupConstrantsLayout(){
        
        NSLayoutConstraint.activate([
            
            
           _tituloLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
           _tituloLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
           _tituloLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),

           _classificacaoLabel.topAnchor.constraint(equalTo: _capaMovieImagemView.bottomAnchor, constant: 32.0),
           _classificacaoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

           _capaMovieImagemView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           _capaMovieImagemView.widthAnchor.constraint(equalToConstant: 192.0),
           _capaMovieImagemView.heightAnchor.constraint(equalToConstant: 264.0),
           _capaMovieImagemView.topAnchor.constraint(equalTo: _tituloLabel.bottomAnchor, constant: 32.0),

           _synopseLabel.topAnchor.constraint(equalTo: _classificacaoLabel.bottomAnchor, constant: 32.0),
           _synopseLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
           _synopseLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),

            
            
            /*
            _tituloLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            _tituloLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            _capaMovieImagemView.topAnchor.constraint(equalTo: _tituloLabel.bottomAnchor, constant: 15),
            _capaMovieImagemView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            _capaMovieImagemView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            //_capaMovieImagemView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant: -70)
            _capaMovieImagemView.heightAnchor.constraint(lessThanOrEqualToConstant: 250),
            
           /* _viewEmBranco.topAnchor.constraint(equalTo: _capaMovieImagemView.bottomAnchor),
            _viewEmBranco.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            _viewEmBranco.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            _viewEmBranco.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)*/
            
            _classificacaoLabel.topAnchor.constraint(equalTo: _capaMovieImagemView.bottomAnchor, constant: 30),
            _classificacaoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            _classificacaoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            _synopseLabel.topAnchor.constraint(equalTo: _classificacaoLabel.bottomAnchor, constant: 20),
            _synopseLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            _synopseLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)*/
            
            
            ])
        
    }
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        AddSubView()
        SetupConstrantsLayout()
        
        //title = movie.title;

        // Do any additional setup after loading the view.
    }
}

