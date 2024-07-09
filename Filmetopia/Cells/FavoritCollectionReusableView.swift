//
//  FavoritCollectionReusableView.swift
//  Filmetopia
//
//  Created by Rodrigo Oliveira on 09/07/24.
//

import UIKit

class FavoritCollectionReusableView: UICollectionReusableView {
    
    //MARK: - Components
    // UICollectionReusableView tipo que a collection pede para adicionar um geader
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28.0, weight: .medium)
        label.textColor = .white
        label.textAlignment = .left
        
        return label
    }()
    
    //MARK - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK - Methods
    
    func setTtitle(_ text: String){
        headerLabel.text = text
    }
    
    func setupConstraints(){
        addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leftAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
}
