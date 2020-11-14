//
//  ViewController.swift
//  AppMusic
//
//  Created by Boss on 10/14/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, UITextFieldDelegate {
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var images: UIImageView!
    
    var arrayImage = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setListImage()
        images.image = UIImage(named: "1")
    }
    
    func setListImage() {
           images.layer.cornerRadius = 10
           passwordTextField.delegate = self
           userTextField.delegate = self
           for i in 0...24 {
               arrayImage.append("\(24 - i)")
           }
       }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField {
        case userTextField:
            if let text = userTextField.text {
                let i = text.count
                if i == 0 {
                    images.image = UIImage(named: "1")
                } else if i < 24 {
                    images.image = UIImage(named: arrayImage[i])
                } else {
                    images.image = UIImage(named: "24")
                }
            }
        case passwordTextField:
            if let text = passwordTextField.text {
                let i = text.count
                if i == 0 {
                    images.image = UIImage(named: "1")
                } else {
                    images.image = UIImage(named: "image25")
                }
            }
            
        default:
            break
        }
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
