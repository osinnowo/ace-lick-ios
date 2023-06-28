//
//  RegistrationRouter.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 26/06/2023.
//

import UIKit

protocol RegistrationRouterProtocol {
    var entry: (UIViewController & RegistrationViewProtocol)? { get }
    static func start(coordinator: MainCoordinator) -> RegistrationRouterProtocol
}

final class RegistrationRouter: RegistrationRouterProtocol {
    var entry: (UIViewController & RegistrationViewProtocol)?
    
    
    static func start(coordinator: MainCoordinator) -> RegistrationRouterProtocol {
        var router = RegistrationRouter()
        var presenter  = RegistrationPresenter()
        var interactor = RegistrationInteractor()
        var view = RegistrationController()
        
        view.presenter = presenter
        view.mainCoordinator = coordinator
        
        presenter.interactor = interactor
        presenter.view = view
        
        interactor.presenter = presenter
        
        router.entry = view
        
        return router
    }
}
