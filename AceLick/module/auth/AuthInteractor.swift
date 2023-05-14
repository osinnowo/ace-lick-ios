//
//  AuthInteractor.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 14/05/2023.
//

import UIKit

protocol AuthInteractorProtocol {
    func authenticate(user with: Auth)
}

final class AuthInteractor: AuthInteractorProtocol {
    var presenter: AuthPresenterProtocol?
    
    func authenticate(user with: Auth) {
        
    }
}
