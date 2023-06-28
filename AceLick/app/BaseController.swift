//
//  BaseView.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 14/05/2023.
//

import UIKit

///Alias - ActionButton
typealias ActionButton = (UIAlertAction) -> Void

///
///BaseController Super Class
///To be sub-class by ViewController
///This where all other cross-cutting concerns and configuration are placed
///DRY - Don't Repeat Yourself
class BaseController: UIViewController {
    public func showAlert(
        title: String = "Alert",
        message: String? = nil,
        style: UIAlertController.Style = .alert,
        okCallback: ActionButton? = nil,
        cancelCallback: ActionButton? = nil) {
            
        let viewController = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: okCallback)
        let cancelAction = UIAlertAction(title: "CANCEL", style: .destructive, handler: cancelCallback)
            
        viewController.addAction([okAction, cancelAction])
        self.present(viewController, animated: true)
    }
    
    ///Implemented tap & dismiss for the ios virtual keyboard
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        view.backgroundColor = .white
    }
    
    ///@Objective-C method that handles keyboard dismissal
    @objc private func handleTap(_ sender: UIView) {
        view.endEditing(true)
    }
}
