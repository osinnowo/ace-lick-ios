//
//  MenuCategoryCell.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 28/06/2023.
//

import UIKit

final class MenuCategoryCell: UICollectionViewCell {
    
    var item: MenuItem? {
        willSet {
            if let item = newValue {
                imageView.image = UIImage(named: item.image)
                titleLabel.text = item.name
                if item.isSelected {
                    container.backgroundColor = .primary
                }
            }
        }
    }
    
    private var container: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrey
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "burger"))
        imageView.layer.cornerRadius = 31
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .lightGrey
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "All"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        contentView.addSubview(container)
        container.addSubview(imageView)
        contentView.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        container.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Container constraints
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            container.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1),
            
            // Image view constraints
            imageView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.7),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            // Title label constraints
            titleLabel.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = imageView.bounds.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

