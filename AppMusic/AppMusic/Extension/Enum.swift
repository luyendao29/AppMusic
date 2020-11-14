//
//  Enum.swift
//  AppMusic
//
//  Created by Boss on 10/14/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit

struct DataMenuView {
    var isOpen: Bool?
    var action: MainLeftMenu?
}

enum MainLeftMenu {
    case guitangdichvu
    case googleMap
    case lichsucaidat
    case lichsugiaodich
    case thongtincanhan
    case caidatnangcao
    case quanlynhom
    case huongdan
    case tamngungdichvu
    case huydichvu
    case dangxuat
    
    static let allDanhSach = [guitangdichvu, googleMap, lichsucaidat, lichsugiaodich, thongtincanhan, caidatnangcao, quanlynhom, huongdan, tamngungdichvu, huydichvu, dangxuat]
    
    var text: String {
        get {
            switch self {
            case .guitangdichvu:
                return "Gửi tặng dịch vụ"
            case .googleMap:
            return "GoogleMap"
            case .lichsucaidat:
            return "Lịch sử cài đặt"
            case .lichsugiaodich:
            return "Lịch sử giao dịch"
            case .thongtincanhan:
            return "Thông tin cá nhân"
            case .caidatnangcao:
            return "Cài đặt nâng cao"
            case .quanlynhom:
            return "Quản lý nhóm"
            case .huongdan:
            return "Hướng dẫn"
            case .tamngungdichvu:
            return "Tạm ngưng dịch vụ"
            case .huydichvu:
            return "Huỷ dịch vụ"
            case .dangxuat:
            return "Đăng xuất"
            }
        }
    }
}
