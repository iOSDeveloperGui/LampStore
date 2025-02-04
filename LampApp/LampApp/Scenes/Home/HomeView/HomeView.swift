//
//  HomeView.swift
//  LampApp
//
//  Created by iOS Developer on 27/01/25.
//

import UIKit

class HomeView: UIView {
    
    //MARK: - UIComponents
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bgHome"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.alpha = 0.4
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.text = "Lamps Store"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    public lazy var carouselCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 70)
        layout.sectionInset = UIEdgeInsets(top: 0, left: (UIScreen.main.bounds.width - UIScreen.main.bounds.width) / 2, bottom: 0, right: (UIScreen.main.bounds.width - UIScreen.main.bounds.width) / 2)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.decelerationRate = .normal
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    public let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .button
        pageControl.pageIndicatorTintColor = .lightGray
        return pageControl
    }()
    
    public lazy var getStartedButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .button
        button.layer.cornerRadius = 12
        return button
    }()
    
    //MARK: - Initializer
    override init(frame: CGRect){
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - addSubViewsMethod
    private func addSubViews(){
        self.addSubview(backgroundImageView)
        self.addSubview(titleLabel)
        self.addSubview(carouselCollectionView)
        self.addSubview(pageControl)
        self.addSubview(getStartedButton)
    }
    
    //MARK: - SetupConstraintsMethod
    private func setupConstraints(){
        //Setting the backgroundImage
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -52),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            
            carouselCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            carouselCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            carouselCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            carouselCollectionView.heightAnchor.constraint(equalToConstant: 70),
            
            pageControl.topAnchor.constraint(equalTo: carouselCollectionView.bottomAnchor),
            pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            getStartedButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
            getStartedButton.heightAnchor.constraint(equalToConstant: 50),
            getStartedButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            getStartedButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
            
        
        ])
    }

}
