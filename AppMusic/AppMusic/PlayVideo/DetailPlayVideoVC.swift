//
//  DetailPlayVideoVC.swift
//  AppMusic
//
//  Created by Boss on 10/15/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class DetailPlayVideoVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var videos: [Video] = Video.fetchVideos()
    var player = AVPlayer()
    var playerViewController = AVPlayerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PlayVideosCell.nib(), forCellReuseIdentifier: PlayVideosCell.identifier())
        // Do any additional setup after loading the view.
    }
    
    // MARK: TableView Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayVideosCell.identifier(), for: indexPath) as! PlayVideosCell
        cell.video = videos[indexPath.row]
        return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        playVideo(index: indexPath)
    }
    
    func playVideo(index: IndexPath) {
        let video = Bundle.main.path(forResource: videos[index.row].videoFile, ofType: "mp4")
        if let video = video {
            let videoPath = URL(fileURLWithPath: video)
            player = AVPlayer(url: videoPath)
            playerViewController.player = player
            
            self.present(playerViewController, animated: true, completion: nil)
        }
    }
}
