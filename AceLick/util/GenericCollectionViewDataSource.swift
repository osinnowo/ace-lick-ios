//
//  GenericCollectionViewDataSource.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 28/06/2023.
//

import UIKit

final class CollectionViewDataSource<C: UICollectionViewCell, M>: NSObject,
                                    UICollectionViewDelegate, UICollectionViewDataSource {
    
    typealias CellConfiguration = (C, IndexPath) -> Void
    typealias OnTapEvent = (IndexPath) -> Void
    
    private var items: [M]
    private var identifier: String
    private var configuration: CellConfiguration?
    private var onTapEvent: OnTapEvent?
    
    init(identifier: String, items: [M], configuration: CellConfiguration? = nil, onTapEvent: OnTapEvent? = nil) {
        self.identifier = identifier
        self.items = items
        self.configuration = configuration
        self.onTapEvent = onTapEvent
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier, for: indexPath) as? C else { fatalError() }
        self.configuration?(cell, indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.onTapEvent?(indexPath)
    }
}
