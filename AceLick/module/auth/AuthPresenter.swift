//
//  AuthPresenter.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 14/05/2023.
//

import UIKit

protocol AuthPresenterProtocol {
    func makeAuthentication(using details: Auth)
    func didFinishAuthentication(with response: AuthResponse)
}

final class AuthPresenter: AuthPresenterProtocol {
    
    var view: AuthViewProtocol?
    var interactor: AuthInteractorProtocol?
    
    func makeAuthentication(using details: Auth) {
        
    }
    
    func didFinishAuthentication(with response: AuthResponse) {
        
    }
}
