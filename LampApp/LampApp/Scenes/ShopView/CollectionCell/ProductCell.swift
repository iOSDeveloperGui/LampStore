//
//  CollectionViewCell.swift
//  LampApp
//
//  Created by iOS Developer on 27/01/25.
//

import UIKit

class ProductCell: UICollectionViewCell {
    //MARK: - Identifier
    static let identifier = "ProductCell"
    
    //MARK: - UIComponents
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .gray
        return label
    }()
    
    //MARK: - Initializer
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - AddSubViewsMethod
    private func addSubViews(){
        contentView.addSubview(productImageView)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(productPriceLabel)
    }
    
    //MARK: - SetupContraintsMethod
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),

            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
            productNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            productPriceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 12),
            productPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productPriceLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        
        ])
    }
    
    //MARK: - SetupConfigureMethod
    public func configure(with product: Product){
        productImageView.image = UIImage(named: product.imageName)
        productNameLabel.text = product.name
        productPriceLabel.text = "$\(product.price)"
    }
}
