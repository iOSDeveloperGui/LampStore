//
//  ShopUIView.swift
//  LampApp
//
//  Created by iOS Developer on 27/01/25.
//

import UIKit

class ShopUIView: UIView{
    //MARK: - UIComponents
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search for items..."
        searchBar.searchTextField.backgroundColor = .white
        searchBar.layer.cornerRadius = 16
        return searchBar
    }()
    
    private lazy var categoryControl: UISegmentedControl = {
        let categories = ["All", "Lamp", "Table", "Clock"]
        let control = UISegmentedControl(items: categories)
        control.translatesAutoresizingMaskIntoConstraints = false
        control.selectedSegmentIndex = 0
        control.backgroundColor = .clear
        control.selectedSegmentTintColor = UIColor.categoryControl
        control.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        control.setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
        return control
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 24, height: 300)
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //MARK: - Initializer
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubViews()
        setupConstraints()
        self.translatesAutoresizingMaskIntoConstraints = false 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - AddSubViewsMethod
    private func addSubViews(){
        self.addSubview(searchBar)
        self.addSubview(categoryControl)
        self.addSubview(collectionView)
    }
    
    //MARK: - SetupConstraints
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            categoryControl.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            categoryControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            categoryControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            categoryControl.heightAnchor.constraint(equalToConstant: 28),
            
            collectionView.topAnchor.constraint(equalTo: categoryControl.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        
        ])
    }
}


