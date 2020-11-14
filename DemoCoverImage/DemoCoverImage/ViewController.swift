//
//  ViewController.swift
//  DemoCoverImage
//
//  Created by Boss on 10/15/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit
import iCarousel

class ViewController: UIViewController, iCarouselDataSource {
    
    
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .rotary
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        myCarousel.autoscroll = -0.2
        
        myCarousel.frame = CGRect(x: 0, y: 30, width: view.frame.size.width, height: 200)
        // Do any additional setup after loading the view.
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

