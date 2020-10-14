//
//  ViewController.swift
//  AppMusic
//
//  Created by Boss on 10/14/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }
    
    func setupTextField() {
        let imageUser = UIImage(named: "l_phone")
        addLeftImageToTextField(textField: userTextField, image: imageUser!)
        let imagePass = UIImage(named: "l_password")
        addLeftImageToTextField(textField: passwordTextField, image: imagePass!)
    }
    
    // add image to TextField
    func addLeftImageToTextField(textField: UITextField, image: UIImage) {
        let leftImageToTextField = UIImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        leftImageToTextField.image = image
        textField.leftView = leftImageToTextField
        textField.leftViewMode = .always
    }
    
    // MARK: Action
    
    @IBAction func loginWith3G(_ sender: Any) {
        self.showAlert(type: .notice, message: "Thuê bao của quý khách không kết nối Internet bằng 3G Mobifone.Vui lòng kiểm tra lại.Xin cảm ơn", close: {
        })
    }
    
    @IBAction func tapLogin(_ sender: Any) {
        let vc = Storyboard.Main.mainViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    

}
