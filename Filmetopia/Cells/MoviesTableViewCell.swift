//
//  MoviesTableViewCell.swift
//  Cinematopia
//
//  Created by Rodrigo Oliveira on 17/06/24.
//

import UIKit
import Kingfisher

class MoviesTableViewCell: UITableViewCell {
    
   private lazy var moviePosterImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.vingadores
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true //para funcionar os cantos arredondados
        //imageView.backgroundColor = .blue
        //imageView.contentMode = .scaleAspectFit // Não preenche todo espaço
       imageView.contentMode = .scaleAspectFill // preenche todo o espaço
       return imageView
    }()
    
    private lazy var movieTituloLabel : UILabel = {
       let label = UILabel()
        label.text = "Vingadores : Ultimato"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        }()
    
    private lazy var dataLancamentoLabel : UILabel = {
        let label = UILabel()
        label.text = "Lançamento : 01/04/2021"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white.withAlphaComponent(0.75)
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    func ConfigureCell(movie : Movie){
        movieTituloLabel.text = movie.title
        let url = URL(string: movie.image)
        moviePosterImageView.kf.setImage(with: url)
        //moviePosterImageView.image = UIImage(named: movie.image)
        dataLancamentoLabel.text = "Lançamento :  \(movie.releaseDate)"
        
    }
    
    private  func AddSubviews() {
        contentView.addSubview(moviePosterImageView)
        contentView.addSubview(movieTituloLabel)
        contentView.addSubview(dataLancamentoLabel)
    }
    
    private func SetupConstraints(){
        NSLayoutConstraint.activate([
            
            moviePosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            moviePosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            //moviePosterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            moviePosterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 100),
            
            //movieTituloLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            movieTituloLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            movieTituloLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 10),
            movieTituloLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            dataLancamentoLabel.topAnchor.constraint(equalTo: movieTituloLabel.bottomAnchor, constant: 7),
            dataLancamentoLabel.leadingAnchor.constraint(equalTo: movieTituloLabel.leadingAnchor)
            //dataLancamentoLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,constant: 30),
            //dataLancamentoLabel.trailingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 249),
            //dataLancamentoLabel.topAnchor.constraint(equalTo: movieTituloLabel.topAnchor, constant: 40)
        ])
        }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        AddSubviews()
        SetupConstraints()
        contentView.backgroundColor = .background
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

#Preview{
    MoviesTableViewCell()
}
