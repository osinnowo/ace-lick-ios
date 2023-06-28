//
//  UIAlertViewController + Ext.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 26/06/2023.
//

import UIKit

extension UIAlertController {
    func addAction(_ actions: [UIAlertAction]) {
        for action in actions {
            self.addAction(action)
        }
    }
}

