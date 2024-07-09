//
//  ViewController.swift
//  Cinematopia
//
//  Created by Rodrigo Oliveira on 04/06/24.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var logoImgeView: UIImageView = {
        let imagemView = UIImageView(image: UIImage.logo)
        imagemView.translatesAutoresizingMaskIntoConstraints = false
        imagemView.contentMode = .scaleAspectFit
        return imagemView
    }()
    
    private lazy var copleImageView: UIImageView = {
        let imagemView = UIImageView()
        imagemView.image = UIImage.couple
        imagemView.translatesAutoresizingMaskIntoConstraints = false
        imagemView.contentMode = .scaleAspectFit
        return imagemView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "O lugar ideal para buscar, salvar e organizar seus filmes favoritos!"
        label.textColor = .white
        label.textAlignment = .center // Posição do texto
        label.font = .systemFont(ofSize: 20, weight: .bold) // Tipo de fonte e tamanho
        label.numberOfLines = 0 // Quantidade de linhas ilimitadas, qualquer outro número será o numero de linhas
        return label
    }()
    
    private lazy var welcomeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Quero Começar", for: .normal)
        button.backgroundColor = .buttonBackGround
        button.setTitleColor(.background, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        return button
    }()
    
    // ajusa a reduzir o código
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [logoImgeView, copleImageView, welcomeLabel, welcomeButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //stackView.backgroundColor = .red
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.alignment = .center
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        //title = "Home"
        addSubViews()
        setupConstraints()
       
    }
    
    @objc private func buttonPress(){
        navigationController?.pushViewController(MoviesViewController(), animated: true)
    }
    
    private func addSubViews(){
        
        view.addSubview(stackView)
        /* Foi substituido pelo stackView
        view.addSubview(logoImgeView)
        view.addSubview(copleImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(welcomeButton)*/
    }
    
   private func setupConstraints() {
       
       NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
        
        welcomeButton.heightAnchor.constraint(equalToConstant: 64),
        welcomeButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 64),
        welcomeButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -64)
        
        
       ])
       
       /* Foi substituido pelo stackview
        NSLayoutConstraint.activate([
        logoImgeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 34),
        logoImgeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        copleImageView.topAnchor.constraint(equalTo: logoImgeView.bottomAnchor, constant: 32),
        copleImageView.centerXAnchor.constraint(equalTo: logoImgeView.centerXAnchor),
       
        welcomeLabel.topAnchor.constraint(equalTo: copleImageView.bottomAnchor, constant: 30),
        welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
        welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        
        welcomeButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 32),
        welcomeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
        welcomeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
        welcomeButton.heightAnchor.constraint(equalToConstant: 52),
       ])*/
       
       /* //label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true Caso não usar o NSLayoutConstraint
       
        NSLayoutConstraint.activate([
            //label.centerXAnchor.constraint(equalTo: view.centerXAnchor),// Centralizar label
            //label.centerYAnchor.constraint(equalTo: view.centerYAnchor)//Centralizar label
            //label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),// Adicionar no topo
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),//Posicionar no bot
            //label.centerXAnchor.constraint(equalTo: view.centerXAnchor) Para deixar no centro e no ropo
            //label.trailingAnchor.constraint(equalTo: view.trailingAnchor) // Posiciona na direita
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
        ])
     */
    }


}

