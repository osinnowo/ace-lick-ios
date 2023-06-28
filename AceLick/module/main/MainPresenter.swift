//
//  AuthPresenter.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 14/05/2023.
//

import UIKit

protocol MainPresenterProtocol {
    func makeAuthentication(using details: Main)
    func didFinishAuthentication(with response: MainResponse)
}

final class MainPresenter: MainPresenterProtocol {
    
    var view: MainViewProtocol?
    var interactor: MainInteractorProtocol?
    
    func makeAuthentication(using details: Main) {
        
    }
    
    func didFinishAuthentication(with response: MainResponse) {
        
    }
}
