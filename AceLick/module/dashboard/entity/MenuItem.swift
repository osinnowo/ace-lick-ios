//
//  MenuItem.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 28/06/2023.
//

import UIKit

var menuItemMockData = [
    MenuItem(name: "Beef Burger", image: "all", isSelected: true, price: 20.00),
    MenuItem(name: "Pizza", image: "pizza", isSelected: false, price: 39.99),
    MenuItem(name: "Rice", image: "rice", isSelected: false, price: 50.45),
    MenuItem(name: "Juice", image: "juice", isSelected: false, price: 60.99),
]


struct MenuItem: Decodable {
    var name: String
    var image: String
    var isSelected: Bool
    var price: Double?
}
