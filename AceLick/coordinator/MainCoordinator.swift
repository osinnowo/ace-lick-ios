//
//  MainCoordinator.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 26/06/2023.
//

import UIKit

final class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let viewController = MainRouter.start(mainCoordinator: self).entry else { return  }
        
        self.navigationController.pushViewController(
            viewController,
            animated: true
        )
       // showDashboard()
    }
    
    func showLogin() {
        guard let viewController = LoginRouter.start(mainCoordinator: self).entry else { return }
        
        self.navigationController.pushViewController(
            viewController,
            animated: true
        )
    }
    
    func showDashboard() {
        let viewController = DashboardViewController()
        viewController.mainCoordinator = self
        
        self.navigationController.pushViewController(
            viewController,
            animated: true
        )
    }
    
    func showRegistration() {
        guard let viewController = RegistrationRouter.start(coordinator: self).entry else { return }
        
        self.navigationController.pushViewController(
            viewController,
            animated: true
        )
    }
}
