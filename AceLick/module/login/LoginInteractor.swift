//
//  LoginInteractor.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 27/06/2023.
//

import UIKit

protocol LoginInteractorProtocol {
    func initiateLoginUsing(network request: LoginRequest)
}

final class LoginInteractor: LoginInteractorProtocol {
    var presenter: LoginPresenterProtocol?
    
    func initiateLoginUsing(network request: LoginRequest) {
        
    }
}
