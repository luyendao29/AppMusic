//
//  MainLeftMenuView.swift
//  AppMusic
//
//  Created by Boss on 10/14/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit

class MainLeftMenuView: UIView, ToggleViewProtocol, UIPreviewActionItem {
    @IBOutlet weak var tableView: UITableView!
    
    
    var title: String = ""
    
    var isOpen: Bool = false
    
    @IBOutlet weak var menu: UIView!
    
    var closureMenu: ((DataMenuView)->(Void))?
    var actionClosure: ((Bool) -> ())?
    
    var closeDistance: CGFloat = 0.0
    
    var showDistance: CGFloat = 0
    
    var view: UIView!
    
    var coverAlpha: CGFloat = 0.4
    
    @IBOutlet weak var controlConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var imageUpandDownOfSelect: UIImageView!
    
    @IBOutlet weak var selectionWorkingTypeButton: UIButton!
    
    @IBOutlet weak var effectView: UIVisualEffectView!
    
    @IBOutlet weak var corverButton: UIButton!
    
    var selectMenu = MainLeftMenu.guitangdichvu
    var arrayMenu = [String]()
    var arrayImage = [String]()
    
    var action = MainLeftMenu.guitangdichvu
    var dataMenu = DataMenuView()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
        tableView.delegate = self
        tableView.dataSource = self
        view = self
        setupToggleView(distance: menu.frame.height + 100)
        fillData()
        setDisplay()
        displayItemMenu()
    }
    
    func setupTableView() {
        tableView.register(MainLeftCell.nib(), forCellReuseIdentifier: MainLeftCell.identifier())
        tableView.register(DetailMainCell.nib(), forCellReuseIdentifier: DetailMainCell.identifier())
    }
    
    func setDisplay() {
        setShadowView(view: menu)
        effectView.isHidden = true
    }
    
    func displayItemMenu() {
            arrayMenu = MainLeftMenu.allDanhSach.map { $0.text }
            arrayImage = ["l_sendGift", "l_boughtService", "l_installedHistory", "l_transactionHistory", "l_userProfile", "l_advancedSetting", "sale", "l_instruction", "l_pause", "l_cancel", "l_logout"]
    }
    
    func fillData() {
//        usernameLabel.text = LocalUser.shared.currentUser?.username
//        nameViewLabel.text = LocalUser.shared.currentUser?.nameview
    }
    
    func setShadowView(view: UIView) {
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    @IBAction func onClickSelected(_ sender: UIButton) {

    }
    
    @IBAction func toggle(_ sender: UIButton! = nil) {
        isOpen = !isOpen
        dataMenu.isOpen = isOpen
        closureMenu?(dataMenu)
        actionClosure?(true)
        performToggle(isOpen: isOpen)
        UIView.animate(withDuration: 0.35) {
            self.alpha = self.isOpen ? 1 : 0
            self.layoutIfNeeded()
        }
    }
    
    @IBAction func tapCoverButton(_ sender: UIButton!) {
        showHideMenu()
    }
    
    func showHideMenu() {
        isOpen = !isOpen
        dataMenu.isOpen = isOpen
        dataMenu.action = nil
        closureMenu?(dataMenu)
        performToggle(isOpen: isOpen)
        UIView.animate(withDuration: 0.35) {
            self.alpha = self.isOpen ? 1 : 0
            self.layoutIfNeeded()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectMenu = MainLeftMenu.allDanhSach[indexPath.row]
        dataMenu.isOpen = true
        dataMenu.action = selectMenu
        closureMenu?(dataMenu)
    }
}


extension MainLeftMenuView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return arrayMenu.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: MainLeftCell.identifier(), for: indexPath) as! MainLeftCell
            cell.passClosure = { data in
                if data == true {
                    self.actionClosure?(false)
                }
                
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailMainCell.identifier(), for: indexPath) as! DetailMainCell
            cell.titleMenuTextView.text = arrayMenu[indexPath.row]
            cell.iconImageView.image = UIImage(named: arrayImage[indexPath.row])
            return cell
        }
    }
}
