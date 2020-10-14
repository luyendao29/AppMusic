//
//  AlertService.swift
//  AppMusic
//
//  Created by Boss on 10/14/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit

enum AlertType {
    case notice
    case warning
    case error
    
    static var all = [notice,warning,error]
    var text: String {
        get {
            switch self {
            case .notice:
                return "Thông Báo"
            case .warning:
                return "Cảnh Báo"
            case .error:
                return "Lỗi"
            }
        }
    }
}

class AlertService {
    let storyboard = UIStoryboard.init(name: "BaseAlert", bundle: nil)
    
    func showAlert(type: AlertType, message: String, close: @escaping () -> Void) -> ShowAlertVC {
        let vc = storyboard.instantiateViewController(withIdentifier: "ShowAlertVC") as! ShowAlertVC
        vc.type = type
        vc.message = message
        vc.closeAction = close
        return vc
    }
    
    func showAlertWithConfirm(type: AlertType, message: String, cancel: @escaping () -> Void, ok: @escaping () -> Void) -> ShowAlertWithConfirm {
        let vc = storyboard.instantiateViewController(withIdentifier: "ShowAlertWithConfirm") as! ShowAlertWithConfirm
//        let vc = storyboard.instantiateViewController(identifier: "ShowAlertWithConfirm") as! ShowAlertWithConfirm
        vc.alertType = type
        vc.message = message
        vc.cancelClosure = cancel
        vc.okClosure = ok
        return vc
    }
}

