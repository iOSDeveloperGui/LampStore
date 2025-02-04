//
//  CarouselCell.swift
//  LampApp
//
//  Created by iOS Developer on 27/01/25.
//

import UIKit

class CarouselCell: UICollectionViewCell{
    //MARK: - Identifier
    static let identifier = "CarouselCell"
    
    //MARK: - UIComponents
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    //MARK: Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - AddSubViewsMethod
    private func addSubViews(){
        contentView.addSubview(descriptionLabel)
    }
    
    //MARK: - SetupConstraints
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 56),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -56),
        ])
    }
    
    func configure(with description: String){
        descriptionLabel.text = description
    }
}

