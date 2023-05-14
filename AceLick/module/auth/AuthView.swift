//
//  AuthView.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 14/05/2023.
//

import UIKit

protocol AuthViewProtocol {
    func perform(login with: Auth)
    func didCompleteLogin()
    func showLoading()
    func hideLoading()
}

final class AuthView: UIViewController, BaseView, AuthViewProtocol {
    var presenter: AuthPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
    }
}

extension AuthView {
    func perform(login with: Auth) {
        
    }
    
    func didCompleteLogin() {
        
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
}
