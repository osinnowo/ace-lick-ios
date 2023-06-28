//
//  LoginViewController.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 26/06/2023.
//

import UIKit

///LoginViewProtocol for Coordinator pattern
///This protocol only exposes what the presenter expect in terms of callbacks
///The whole essence of this is to create loosely couple implementation
protocol LoginViewProtocol {
    func didFinishLogin(with response: LoginResponse)
    func didFinishLogin(with error: LoginError)
}

///LoginViewController
///Handles Authentication & Pre-Auth Logic -> Dashboard
final class LoginController: BaseController, AceButtonDelegate, LoginViewProtocol {
    
    var mainCoordinator: MainCoordinator?
    var presenter: LoginPresenterProtocol?
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login to your account"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private var emailTextField: AceTextField = {
        let textField = AceTextField()
        textField.keyboardType = .emailAddress
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter your Email",
            attributes: [
                .foregroundColor: UIColor.gray
            ]
        )
        return textField
    }()
    
    private var passwordTextField: AceTextField = {
        let textField = AceTextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter your Email",
            attributes: [
                .foregroundColor: UIColor.gray
            ]
        )
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private var submitButton: AceButton = {
        let button = AceButton(title: "Login", style: .flat, color: .primary)
        return button
    }()
    
    private var footNoteLabel: UILabel = {
        let label = UILabel()
        let attribute = NSMutableAttributedString(
            string: "Already have an account? ",
            attributes:
                [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                    NSAttributedString.Key.foregroundColor: UIColor.black
                ]
        )
        attribute.append(NSAttributedString(
            string: "Sign in",
            attributes:
                [
                    NSAttributedString.Key.foregroundColor: UIColor.primary,
                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13)
                ]
        ))
        
        label.attributedText = attribute
        label.textAlignment = .center
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
        addTwoToneGradientBackground(topColor: .primary, bottomColor: .white)
        submitButton.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    private func setupView() {
        view.addSubview(
            [
                titleLabel,
                emailTextField,
                passwordTextField,
                submitButton,
                footNoteLabel
            ]
        )
    }
    
    private func setupConstraint() {
        titleLabel.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 200
        )
        
        
        emailTextField.anchor(
            top: titleLabel.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 120,
            paddingLeft: 20,
            paddingRight: 20
        )
        
        passwordTextField.anchor(
            top: emailTextField.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 20,
            paddingLeft: 20,
            paddingRight: 20
        )
        
        
        submitButton.anchor(
            left: view.leftAnchor,
            bottom: footNoteLabel.topAnchor,
            right: view.rightAnchor,
            paddingLeft: 20,
            paddingBottom: 10,
            paddingRight: 20
        )
        
        footNoteLabel.anchor(
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor,
            paddingLeft: 20,
            paddingBottom: 40,
            paddingRight: 20
        )
    }
}

extension LoginController {
    func didFinishLogin(with response: LoginResponse) {
        
    }
    
    func didFinishLogin(with error: LoginError) {
        
    }
    
    func onClick(sender: AceButton) {
        self.mainCoordinator?.showDashboard()
    }
}
