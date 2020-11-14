//
//  Video.swift
//  AppMusic
//
//  Created by Boss on 10/15/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit

struct Video {
    let name: String?
    let videoFile: String?
    let description: String?
    let thumbnaiFileName: String?
    
    static func fetchVideos() -> [Video] {
        let v1 = Video(name: "Hiền Hồ", videoFile: "v1", description: "Hiền hồ 1", thumbnaiFileName: "hienho")
        let v2 = Video(name: "Khánh Phương", videoFile: "v2", description: "Hiền hồ 2", thumbnaiFileName: "phuong")
        let v3 = Video(name: "Lâm chấn Khang", videoFile: "v3", description: "Hiền hồ 3", thumbnaiFileName: "khang")
        let v4 = Video(name: "Hà Anh Tuấn", videoFile: "v4", description: "Hiền hồ 4", thumbnaiFileName: "tuan")
        let v5 = Video(name: "Nguyễn Như Lan", videoFile: "v5", description: "Hiền hồ 5", thumbnaiFileName: "tay1")
        let v6 = Video(name: "TayLoSwift", videoFile: "v6", description: "Hiền hồ 6", thumbnaiFileName: "tay4")
        return [v1, v2, v3, v4, v5, v6]
    }
}
