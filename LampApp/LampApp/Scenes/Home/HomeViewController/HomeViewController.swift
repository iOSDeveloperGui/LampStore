//
//  ViewController.swift
//  LampApp
//
//  Created by iOS Developer on 27/01/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    private let contentView: HomeView
    private let viewModel: HomeViewModel
    private let coordinator: HomeCoordinator
    
    //MARK: - Initializer
    init(contentView: HomeView, viewModel: HomeViewModel, coordinator: HomeCoordinator){
        self.contentView = contentView
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - AppLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        addSubViews()
        setupConstraints()
        setupPageControl()
        configureCollectionView()
    }
    
    //MARK: - AddSubViewsMethod
    private func addSubViews(){
        view.addSubview(contentView)
    }
    
    //MARK: - SetupConstraintsMethod
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    //MARK: - setupPageControlMethod
    private func setupPageControl(){
        contentView.pageControl.numberOfPages = viewModel.lampDescriptions.count
        contentView.pageControl.addTarget(self, action: #selector(pageControlChanged(_:)), for: .valueChanged)
        contentView.getStartedButton.addTarget(self, action: #selector(getStartedButtonTapped), for: .touchUpInside)

    }
    
    //MARK: - configureCollectionViewMethod
    private func configureCollectionView(){
        contentView.carouselCollectionView.delegate = self
        contentView.carouselCollectionView.dataSource = self
    }
    
    //MARK: - SetupScrollViewMethod
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let itemWidth = UIScreen.main.bounds.width * 0.8
        let spacing = (UIScreen.main.bounds.width - itemWidth) / 2
        let adjustedOffset = scrollView.contentOffset.x + spacing
        let page = round(adjustedOffset / itemWidth)
        contentView.pageControl.currentPage = Int(page)
    }

    //MARK: - getStartedButtonTappedMethdo
    @objc private func getStartedButtonTapped(){
        coordinator.navigateToShop()
    }
    
    //MARK: - pageControlChangedMethod
    @objc private func pageControlChanged(_ sender: UIPageControl){
        let indexPath = IndexPath(item: sender.currentPage, section: 0)
        contentView.carouselCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

}

    //MARK: - UICollectionViewDataSource & UICollectionViewDelegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.lampDescriptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.identifier, for: indexPath) as! CarouselCell
        cell.configure(with: viewModel.lampDescriptions[indexPath.item])
        return cell
    }
    
}



