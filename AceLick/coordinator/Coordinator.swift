//
//  Coordinator.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 26/06/2023.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
