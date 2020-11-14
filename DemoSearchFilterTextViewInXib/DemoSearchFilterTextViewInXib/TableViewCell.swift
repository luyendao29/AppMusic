//
//  TableViewCell.swift
//  DemoSearchFilterTextViewInXib
//
//  Created by Boss on 10/22/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var searchTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
