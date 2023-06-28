//
//  MenuItem.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 28/06/2023.
//

import UIKit
 var menuMockData = [
    MenuItem(name: "All", image: "all", isSelected: true),
    MenuItem(name: "Burger", image: "burger", isSelected: false),
    MenuItem(name: "Pizza", image: "pizza", isSelected: false),
    MenuItem(name: "Rice", image: "rice", isSelected: false),
    MenuItem(name: "Juice", image: "juice", isSelected: false),
]

var menuItemMockData = [
    MenuItem(name: "Beef Burger", image: "all", isSelected: true, price: 20.00),
    MenuItem(name: "Pizza", image: "pizza", isSelected: false, price: 39.99),
    MenuItem(name: "Rice", image: "rice", isSelected: false, price: 50.45),
    MenuItem(name: "Juice", image: "juice", isSelected: false, price: 60.99),
]


class MenuItem {
    var name: String
    var image: String
    var isSelected: Bool
    var price: Double?
    init(name: String, image: String, isSelected: Bool, price: Double = 0.0) {
        self.name = name
        self.image = image
        self.isSelected = isSelected
        self.price = price
    }
}


