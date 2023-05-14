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

final class AuthViewController: UIViewController, BaseController, AuthViewProtocol, AceButtonDelegate {
    var presenter: AuthPresenter?
    
    private lazy var getStartedButton: AceButton = {
        let button = AceButton(
            title: "Get Started",
            color: .default,
            textStyle: .bold
        )
        button.delegate = self
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "logo"))
        image.layer.cornerRadius = 150
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Enjoy Your Meal"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
        addTwoToneGradientBackground(topColor: .primary, bottomColor: .white)
    }
    
    private func setupView() {
        view.addSubview(
            [
                logoImageView,
                titleLabel,
                getStartedButton
            ]
        )
    }
    
    private func setupConstraint() {
        
        logoImageView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 132,
            paddingLeft: 75,
            paddingRight: 65,
            width: 300,
            height: 300
        )
        
        titleLabel.anchor(
            top: logoImageView.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 98,
            paddingLeft: 34,
            paddingRight: 34
        )
        
        getStartedButton.anchor(
            top: titleLabel.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 90,
            paddingLeft: 34,
            paddingRight: 34
        )
    }
    
    func onClick(sender: AceButton) {
        print("Clicked!")
    }
}

extension AuthViewController {
    
    func perform(login with: Auth) {
        
    }
    
    func didCompleteLogin() {
        
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
}
