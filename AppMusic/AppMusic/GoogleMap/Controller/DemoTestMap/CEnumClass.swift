//
//  CEnumClass.swift
//  AppMusic
//
//  Created by Boss on 10/16/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import Foundation
import AVFoundation

class CEnumObj: NSObject {
    static let shareInstance = CEnumObj()
    func covertToJSON(resultDict: NSDictionary) -> NSDictionary {
        let theJSONData = try? JSONSerialization.data(withJSONObject: resultDict, options: JSONSerialization.WritingOptions(rawValue: 0))
        let jsonString = NSString(data: theJSONData!, encoding: String.Encoding.utf8.rawValue)
        let returnDict = self.convertToDictinary(text: jsonString! as String)
        let userData = returnDict as NSDictionary? as? [AnyHashable: Any] ?? [:]
        return userData as NSDictionary
    }
    
    func convertToDictinary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                let jsonDict = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: UInt(0)))
                return jsonDict as? [String: Any]
            } catch {
                
            }
        }
        return nil
    }
}
