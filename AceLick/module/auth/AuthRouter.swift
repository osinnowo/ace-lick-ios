//
//  AuthRouter.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 14/05/2023.
//

import UIKit

typealias Entry = UIViewController & AuthViewProtocol

protocol AuthRouterProtocol {
    var entry: Entry? { get }
    static func start() -> AuthRouterProtocol
}

final class AuthRouter: AuthRouterProtocol {
    var entry: Entry?
    
    static func start() -> AuthRouterProtocol {
        var router = AuthRouter()
        var presenter = AuthPresenter()
        var interactor = AuthInteractor()
        var view = AuthViewController()
        
        presenter.interactor = interactor
        presenter.view = view
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.entry = view
        return router
    }
}
