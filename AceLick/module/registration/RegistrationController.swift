//
//  RegistrationViewController.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 26/06/2023.
//

import UIKit

protocol RegistrationViewProtocol {
    func didFinishRegister(with response: RegistrationResponse)
    func showLoading()
    func hideLoading()
    func showError()
}

final class RegistrationController: BaseController, RegistrationViewProtocol, AceButtonDelegate {
    var mainCoordinator: MainCoordinator?
    var presenter: RegistrationPresenterProtocol?
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create an account"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private var nameTextField: AceTextField = {
        let textField = AceTextField()
        let attributedPlaceholder: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray,
        ]
        textField.attributedPlaceholder = NSAttributedString(
            string:  "Enter your Full Name",
            attributes: attributedPlaceholder
        )
        return textField
    }()
    
    private var emailTextField: AceTextField = {
        let textField = AceTextField()
        textField.keyboardType = .emailAddress
        let attributedPlaceholder: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray,
        ]
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter your Email",
            attributes: attributedPlaceholder
        )
        return textField
    }()
    
    private var passwordTextField: AceTextField = {
        let textField = AceTextField()
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        
        let attributedPlaceholder: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray,
        ]
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter your Password",
            attributes: attributedPlaceholder
        )
        return textField
    }()
    
    private var confirmPasswordTextField: AceTextField = {
        let textField = AceTextField()
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        let attributedPlaceholder: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray,
        ]
        textField.attributedPlaceholder = NSAttributedString(
            string: "Confirm Password",
            attributes: attributedPlaceholder
        )
        return textField
    }()
    
    private var submitButton: AceButton = {
        let button = AceButton(title: "Register", style: .flat, color: .primary)
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
                nameTextField,
                emailTextField,
                passwordTextField,
                confirmPasswordTextField,
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
        
        nameTextField.anchor(
            top: titleLabel.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 130,
            paddingLeft: 20,
            paddingRight: 20
        )
        
        emailTextField.anchor(
            top: nameTextField.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 20,
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
        
        confirmPasswordTextField.anchor(
            top: passwordTextField.bottomAnchor,
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
    
    @objc private func navigateTo(_ sender: UIView) {
        
    }
    
    func onClick(sender: AceButton) {
        self.mainCoordinator?.showLogin()
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func showError() {
        
    }
    
    func didFinishRegister(with response: RegistrationResponse) {
        
    }
}
