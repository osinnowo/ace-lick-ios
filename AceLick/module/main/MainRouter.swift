//
//  AuthRouter.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 14/05/2023.
//

import UIKit

typealias Entry = UIViewController & MainViewProtocol

protocol MainRouterProtocol {
    var entry: Entry? { get }
    static func start(mainCoordinator: MainCoordinator?) -> MainRouterProtocol
}

final class MainRouter: MainRouterProtocol {
    var entry: Entry?
    
    static func start(mainCoordinator: MainCoordinator?) -> MainRouterProtocol {
        var router = MainRouter()
        var presenter = MainPresenter()
        var interactor = MainInteractor()
        var view = MainViewController()
        
        view.mainCoordinator = mainCoordinator
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        
        interactor.presenter = presenter
        router.entry = view
        return router
    }
}
