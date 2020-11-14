//
//  UsingStoryBoard.swift
//  DemoCoverImage
//
//  Created by Boss on 10/15/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit
import iCarousel

class UsingStoryBoard: UIViewController, iCarouselDataSource {
    
    @IBOutlet weak var uiview: iCarousel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiview.type = .rotary
        uiview.contentMode = .scaleToFill
        uiview.isPagingEnabled = true
        uiview.autoscroll = -0.1
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
