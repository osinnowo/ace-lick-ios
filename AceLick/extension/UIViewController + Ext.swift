//
//  UIViewController.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 14/05/2023.
//

import UIKit

extension UIViewController {
    func addTwoToneGradientBackground(topColor: UIColor, bottomColor: UIColor) {
        // Create the gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        // Set the gradient colors
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        
        // Set the gradient direction from top to bottom
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 3.45)
        
        // Insert the gradient layer at the bottom of the view's layer hierarchy
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
