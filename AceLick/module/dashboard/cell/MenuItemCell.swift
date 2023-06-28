//
//  MenuItemCell.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 28/06/2023.
//

import UIKit

final class MenuCell: UICollectionViewCell {
    
    var item: MenuItem? {
        willSet {
            if let item = newValue {
                imageView.image = UIImage(named: item.image)
                nameLabel.text = item.name
                priceLabel.text = "$\(item.price!)"
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
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Beef Burger"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$20.00"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor.kitYellow
        label.textAlignment = .center
        return label
    }()
    
    private var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .kitGreen
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        contentView.addSubview(
            [
                container,
                imageView,
                nameLabel,
                priceLabel,
                addButton
            ]
        )
    }
    
    private func setupConstraints() {
        container.anchor(
            top: contentView.topAnchor,
            left: contentView.leftAnchor,
            bottom: contentView.bottomAnchor,
            right: contentView.rightAnchor
        )
        
        imageView.centerX(
            inView: container,
            topAnchor: container.topAnchor,
            paddingTop: 20,
            width: 107,
            height: 107
        )
        
        nameLabel.anchor(
            top: imageView.bottomAnchor,
            left: container.leftAnchor,
            paddingTop: 10,
            paddingLeft: 20
        )
        
        priceLabel.anchor(
            top: nameLabel.bottomAnchor,
            left: container.leftAnchor,
            paddingTop: 10,
            paddingLeft: 20
        )
        
        addButton.anchor(
            top: nameLabel.bottomAnchor,
            right: container.rightAnchor,
            paddingTop: 10,
            paddingRight: 20,
            width: 24,
            height: 24
        )
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = imageView.bounds.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

