//
//  BaseViewController.swift
//  AppMusic
//
//  Created by Boss on 10/14/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit
import KVLoading


class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var spinner = UIActivityIndicatorView()
    let alertService = AlertService()
    lazy var isLoading: Bool = false
    private var enableHideKeyBoardWhenTouchInScreen: Bool = true
    var isEnableHideKeyBoardWhenTouchInScreen: Bool {
        get {
            return self.enableHideKeyBoardWhenTouchInScreen ? true : false
        }
        
        set {
            self.enableHideKeyBoardWhenTouchInScreen = newValue
            if self.enableHideKeyBoardWhenTouchInScreen {
                let touchOnScreen = UITapGestureRecognizer(target: self, action: #selector(self.touchOnScreen))
                touchOnScreen.delegate = self
                touchOnScreen.cancelsTouchesInView = false
                view.addGestureRecognizer(touchOnScreen)
            }
        }
    }
    
    @objc func touchOnScreen() {
        view.endEditing(true)
    }
    
    func setSpinner() {
        if #available(iOS 13.0, *) {
            spinner.style = .large
        } else {
            spinner.style = .whiteLarge
        }
//        spinner.style = .large
        
        spinner.color = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func showLoading() {
        setSpinner()
        spinner.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    func hideLoading() {
        spinner.stopAnimating()
        view.isUserInteractionEnabled = true
    }
    
    func showAlert(type: AlertType, message: String, close: @escaping () -> Void) -> Void {
        let vc = alertService.showAlert(type: type, message: message, close: close)
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: false, completion: nil)
    }
    
    func showAlertWithConfirm(type: AlertType, message: String, cancel: @escaping () -> Void, ok: @escaping () -> Void) -> Void {
        let vc = alertService.showAlertWithConfirm(type: type, message: message, cancel: cancel, ok: ok)
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: false, completion: nil)
    }
}
