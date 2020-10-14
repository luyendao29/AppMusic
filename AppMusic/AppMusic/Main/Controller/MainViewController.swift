//
//  MainViewController.swift
//  AppMusic
//
//  Created by Boss on 10/14/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var sideMenuView: MainLeftMenuView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        setMenuView()
        navigationItem.leftBarButtonItem?.image = #imageLiteral(resourceName: "menu")
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        title = "Mobifone"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    


    
    
    func setMenuView() {
        view.addSubview(sideMenuView)
        sideMenuView.fill(left: 0, top: 0, right: 0, bottom: -100)
        sideMenuView.alpha = 0
        sideMenuView.closureMenu = { [weak self] (data) in
            if let isOpen = data.isOpen {
                self?.navigationController?.navigationBar.isHidden = isOpen
            }
            if let action = data.action {
                self?.selectActionMenu(action)
            }
        }
        sideMenuView.actionClosure = { data in
            if data == false {
                let vc = Storyboard.Main.mainViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }
        //        sideMenuView.reloadInputViews()
    }
    
    func selectActionMenu(_ action: MainLeftMenu) {
        switch action {
        case .guitangdichvu:
            sideMenuView.showHideMenu()
            let vc = Storyboard.Main.mainViewController()
            //title = ""
            navigationController?.pushViewController(vc, animated: true)
        case .nhacchodamua:
            break
        case .lichsucaidat:
            break
        case .lichsugiaodich:
            break
        case .thongtincanhan:
            break
        case .caidatnangcao:
            break
        case .quanlynhom:
            break
        case .huongdan:
            break
        case .tamngungdichvu:
            break
        case .huydichvu:
            break
        case .dangxuat:
            break
        }
    }
    // MARK: Action
    
    
    @IBAction func tapMenu(_ sender: Any) {
        navigationController?.navigationBar.isHidden = !sideMenuView.isOpen
        sideMenuView.toggle()
    }
    
}
