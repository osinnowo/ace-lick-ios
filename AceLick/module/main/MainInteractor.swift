//
//  AuthInteractor.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 14/05/2023.
//

import UIKit

protocol MainInteractorProtocol {
    func authenticate(user with: Main)
}

final class MainInteractor: MainInteractorProtocol {
    var presenter: MainPresenterProtocol?
    
    func authenticate(user with: Main) {
        
    }
}
