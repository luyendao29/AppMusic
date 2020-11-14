//
//  MainViewController.swift
//  AppMusic
//
//  Created by Boss on 10/14/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit
import iCarousel

class MainViewController: BaseViewController, UIScrollViewDelegate, iCarouselDataSource {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var sideMenuView: MainLeftMenuView!
    @IBOutlet weak var uiview: iCarousel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        setMenuView()
        navigationItem.leftBarButtonItem?.image = #imageLiteral(resourceName: "menu")
        setupUiView()
    }
    
    func setupUiView() {
        uiview.type = .rotary
        uiview.contentMode = .scaleToFill
        uiview.isPagingEnabled = true
        uiview.autoscroll = -0.1
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
    }
    
    func selectActionMenu(_ action: MainLeftMenu) {
        switch action {
        case .guitangdichvu:
            sideMenuView.showHideMenu()
            let vc = Storyboard.Main.mainViewController()
            //title = ""
            navigationController?.pushViewController(vc, animated: true)
        case .googleMap:
            let vc = Storyboard.Main.mainViewController()
            title = ""
//            /vc.titleString = "GoogleMap"
            navigationController?.pushViewController(vc, animated: true)
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
    
    func numberOfItems(in carousel: iCarousel) -> Int {
          return 4
      }

      func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
          let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200))
          view.backgroundColor = .red
          let image = UIImageView(frame: view.bounds)
          view.addSubview(image)
          image.contentMode = .scaleToFill
          image.image = UIImage(named: "tay\(index+1)")
          return view
      }
    
}
