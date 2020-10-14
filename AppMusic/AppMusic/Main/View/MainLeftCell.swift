//
//  MainLeftCell.swift
//  AppMusic
//
//  Created by Boss on 10/14/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit


class MainLeftCell: BaseTableViewCell {

    var passClosure: ((Bool) -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func onTapMusicOnline(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            passClosure?(true)
        case 1:
            passClosure?(true)
        default:
            break
        }
        
    }
    
}
