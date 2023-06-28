//
//  RegistrationPresenter.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 26/06/2023.
//

import UIKit

protocol RegistrationPresenterProtocol {
    func initiate(registration using: RegistrationDetail)
    func didFinishCalling(registration with: RegistrationResponse)
}

final class RegistrationPresenter: RegistrationPresenterProtocol {
    
    public var view: RegistrationViewProtocol?
    public var interactor: RegistrationInteractorProtocol?
    
    func initiate(registration using: RegistrationDetail) {
        
    }
    
    func didFinishCalling(registration with: RegistrationResponse) {
        
    }
}

