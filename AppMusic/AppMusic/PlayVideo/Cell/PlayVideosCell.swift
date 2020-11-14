//
//  PlayVideosCell.swift
//  AppMusic
//
//  Created by Boss on 10/15/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit

class PlayVideosCell: BaseTableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var images: UIImageView!
    
    var video: Video! {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI() {
        images.image = UIImage(named: video.thumbnaiFileName ?? "")
        images.layer.cornerRadius = 8.0
        images.layer.masksToBounds = true
        
        nameLabel.text = video.name
    }
    
}
