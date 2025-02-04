//
//  ShopViewController.swift
//  LampApp
//
//  Created by iOS Developer on 27/01/25.
//

import UIKit

class ShopViewController: UIViewController {
    //MARK: - Properties
    private let contentView: ShopUIView
    
    
    //MARK: - Initializer
    init(contentView: ShopUIView){
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .shopbg
        addSubViews()
        SetupConstraints()
        setUpNavigationBar()
        setUpTabBar()
    }
    
    //MARK: - AddSubViewsMethod
    private func addSubViews(){
        view.addSubview(contentView)
    }
    
    //MARK: - SetupConstraints
    private func SetupConstraints(){
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        ])
    }
    
    //MARK: - SetUpNavigationBar
    private func setUpNavigationBar(){
        self.navigationItem.title = "Welcome 💡"
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    //MARK: - SetUpTabBar
    private func setUpTabBar(){
        let contentView = ShopUIView()
        let vc1 = ShopViewController(contentView: contentView)
        let vc2 = ShopViewController(contentView: contentView)
        
        vc1.tabBarItem.image = UIImage(systemName: "House")
        vc2.tabBarItem.image = UIImage(systemName: "heart")
        vc1.tabBarItem.title = "Home"
        vc1.tabBarItem.title = "Heart"

    }

}

    //MARK: - UICollectionViewDataSource & UICollectionViewDelegate
extension ShopUIView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else{
            return UICollectionViewCell()
        }
        let product = products[indexPath.row]
        cell.configure(with: product)
        return cell
    }
    
    
}
