//
//  LoginRouter.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 27/06/2023.
//

import UIKit

typealias LoginEntry = UIViewController & LoginViewProtocol

protocol LoginRouterProtocol {
    var entry: LoginEntry? { get }
    static func start(mainCoordinator: MainCoordinator) -> LoginRouterProtocol
}

final class LoginRouter: LoginRouterProtocol {
    var entry: LoginEntry?
    
    static func start(mainCoordinator: MainCoordinator) -> LoginRouterProtocol {
        var router = LoginRouter()
        var view = LoginController()
        var presenter = LoginPresenter()
        var interactor = LoginInteractor()
        
        presenter.view = view
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        view.mainCoordinator = mainCoordinator
        
        router.entry = view
        return router
    }
}
