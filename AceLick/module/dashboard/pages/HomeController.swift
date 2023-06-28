//
//  HomeController.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 27/06/2023.
//

import UIKit

final class HomeController: BaseController {
    
    private var dataSource: CollectionViewDataSource<MenuCategoryCell, MenuItem>?
    private var menuItemSource: CollectionViewDataSource<MenuCell, MenuItem>?
    
    private var menuLabel: UILabel = {
        let label = UILabel()
        label.text = "Menu"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    
    private var profileImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profile"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setDimensions(width: 52, height: 52)
        imageView.layer.cornerRadius = 26
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.itemSize = CGSize(width: 90, height: 132)
        collectionView.register(MenuCategoryCell.self, forCellWithReuseIdentifier: "menu")
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private var menuItemCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.itemSize = CGSize(width: 175, height: 210)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: "menuItem")
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private var popularLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(
            string: "Popular",
            attributes:
                [
                    .foregroundColor: UIColor.black,
                    .font: UIFont.systemFont(ofSize: 28, weight: .semibold)
                ]
        )
        return label
    }()
    
    private var promotionLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(
            string: "Promotion",
            attributes:
                [
                    .foregroundColor: UIColor.black,
                    .font: UIFont.systemFont(ofSize: 28, weight: .semibold)
                ]
        )
        return label
    }()
    
    private var searchEditText: UITextField = {
        let textFieldField = UITextField()
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: textFieldField.frame.height))
        let imageView = UIImageView(image: UIImage(named: "search"))
        imageView.tintColor = .gray
        imageView.contentMode = .center
        imageView.frame = CGRect(x: 10, y: 0, width: 20, height: leftView.frame.height)
        leftView.addSubview(imageView)
        
        // Set left view to the text field
        textFieldField.leftView = leftView
        textFieldField.leftViewMode = .always
        textFieldField.backgroundColor = .lightGrey
        textFieldField.layer.cornerRadius = 8
        textFieldField.textColor = .black
        textFieldField.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [
                .font: UIFont.systemFont(ofSize: 18, weight: .semibold),
                .foregroundColor: UIColor.gray
            ]
        )
        return textFieldField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
        setupCollection()
        setupMenuItemCollection()
    }
    
    private func setupView() {
        view.addSubview(
            [
                menuLabel,
                profileImage,
                searchEditText,
                collectionView,
                popularLabel,
                menuItemCollectionView,
                promotionLabel
            ]
        )
    }
    
    private func setupConstraint() {
        menuLabel.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            paddingTop: 5,
            paddingLeft: 20
        )
        
        profileImage.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            right: view.rightAnchor,
            paddingRight: 20
        )
        
        searchEditText.anchor(
            top: profileImage.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 20,
            paddingLeft: 20,
            paddingRight: 20,
            height: 50
        )
        
        collectionView.anchor(
            top: searchEditText.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 20,
            paddingLeft: 20,
            paddingRight: 20,
            height: 132
        )
        
        popularLabel.anchor(
            top: collectionView.bottomAnchor,
            left: view.leftAnchor,
            paddingTop: 30,
            paddingLeft: 20
        )
        
        menuItemCollectionView.anchor(
            top: popularLabel.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 20,
            paddingLeft: 20,
            paddingRight: 20,
            height: 210
        )
        
        promotionLabel.anchor(
            top: menuItemCollectionView.bottomAnchor,
            left: view.leftAnchor,
            paddingTop: 30,
            paddingLeft: 20
        )
    }
    
    private func setupCollection() {
        dataSource = CollectionViewDataSource(
            identifier: "menu",
            items: menuMockData,
            configuration: { cell, path in
                cell.item = menuMockData[path.row]
            },
            onTapEvent: { path in
                self.chooseItem(path)
            }
        )
        self.collectionView.delegate = dataSource
        self.collectionView.dataSource = dataSource
        self.collectionView.reloadData()
    }
    
    private func setupMenuItemCollection() {
        menuItemSource = CollectionViewDataSource(
            identifier: "menuItem",
            items: menuItemMockData,
            configuration: { cell, path in
                cell.item = menuItemMockData[path.row]
            }
        )
        self.menuItemCollectionView.delegate = self.menuItemSource
        self.menuItemCollectionView.dataSource = self.menuItemSource
        self.menuItemCollectionView.reloadData()
    }
    
    private func chooseItem(_ path: IndexPath) {
        DispatchQueue.main.async {
            for (index, item) in menuMockData.enumerated() {
                item.isSelected = false
            }
            menuMockData[path.row].isSelected = true
            self.collectionView.delegate = self.dataSource
            self.collectionView.dataSource = self.dataSource
            self.collectionView.reloadData()
        }
    }
}
