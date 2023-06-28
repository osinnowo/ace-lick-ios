//
//  LoginPresenter.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 27/06/2023.
//

import UIKit

protocol LoginPresenterProtocol {
    func initiateLogin(with request: LoginRequest)
    func didFinishInitiate(login with: LoginResponse)
}

final class LoginPresenter: LoginPresenterProtocol {
    
    var interactor: LoginInteractorProtocol?
    var view: LoginViewProtocol?
    
    func initiateLogin(with request: LoginRequest) {
        
    }
    
    func didFinishInitiate(login with: LoginResponse) {
        
    }
}
