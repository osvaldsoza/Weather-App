//
//  ViewController.swift
//  Weather App
//
//  Created by Osvaldo Souza Ferreira on 02/11/23.
//

import UIKit

class ViewController: UIViewController {
 
    private let PRIMARY_COLOR = "primaryColor"
    private let SUN_ICON = "sunIcon"
    private let BACKGROUND = "background"
    private let WHITE = "colorWhite"

    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: BACKGROUND)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: WHITE)
        view.layer.cornerRadius = 20
        return view
        
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "São Paulo"
        label.textAlignment = .center
        label.textColor = UIColor(named: PRIMARY_COLOR)
        return label
    }()
    
    private lazy var temparatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 70, weight: .bold)
        label.text = "25°C"
        label.textAlignment = .left
        label.textColor = UIColor(named: PRIMARY_COLOR)
        return label
    }()
    
    private lazy var weatherView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: SUN_ICON)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var humidityLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Umidade"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(named: WHITE)
        return label
    }()
    
    private lazy var humidityValueLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1000mm"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(named: WHITE)
        return label
    }()
    
    private lazy var humidityStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [humidityLabel,humidityValueLabel])
        stackView.translatesAutoresizingMaskIntoConstraints =  false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var windiLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vento"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(named: WHITE)
        return label
    }()
    
    private lazy var windiValueLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10Km/h"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(named: WHITE)
        return label
    }()
    
    private lazy var windiStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [windiLabel,windiValueLabel])
        stackView.translatesAutoresizingMaskIntoConstraints =  false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var statsStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [humidityStackView,windiStackView])
        stackView.translatesAutoresizingMaskIntoConstraints =  false
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.backgroundColor = UIColor(named: "softGray")
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12,
                                                                     leading: 24,
                                                                     bottom: 12,
                                                                     trailing: 24)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .red
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        view.addSubview(backgroundView)
        view.addSubview(headerView)
        view.addSubview(statsStackView)
        
        headerView.addSubview(cityLabel)
        headerView.addSubview(temparatureLabel)
        headerView.addSubview(weatherView)

    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35),
            headerView.heightAnchor.constraint(equalToConstant: 169)
        ])
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15),
            cityLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant:     15),
            cityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15),
            cityLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            temparatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 21),
            temparatureLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant:     26)
        ])
        
        NSLayoutConstraint.activate([
            weatherView.heightAnchor.constraint(equalToConstant: 86),
            weatherView.widthAnchor.constraint(equalToConstant: 86),
            weatherView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,constant: -26),
            weatherView.centerYAnchor.constraint(equalTo: temparatureLabel.centerYAnchor),
            weatherView.leadingAnchor.constraint(equalTo: temparatureLabel.trailingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            statsStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            statsStackView.widthAnchor.constraint(equalToConstant: 206),
            statsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}

