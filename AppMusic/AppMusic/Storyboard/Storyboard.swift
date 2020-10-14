//
//  Storyboard.swift
//  AppMusic
//
//  Created by Boss on 10/14/20.
//  Copyright © 2020 Boss. All rights reserved.
//
import UIKit

struct Storyboard {
    
}
extension Storyboard {
    //Login, Main
    struct Main {
        static let manager = UIStoryboard(name: "Main", bundle: nil)
        
        static func mainViewController() -> MainViewController {
            return manager.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        }
    }
}

