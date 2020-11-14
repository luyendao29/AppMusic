//
//  RidePath.swift
//  AppMusic
//
//  Created by Boss on 10/16/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import SwiftyJSON

extension RideNowViewController {
    func getPolylineRoute(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let origin1 = "\(source.latitude),\(source.longitude)"
        let destination1 = "\(destination.latitude),\(destination.longitude)"
        let url = URL(string:
            "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin1)&destination=\(destination1)&mode=driving&key=AIzaSyC6a50plf6zJbvuBcmzBpRd3CQp4BRy1yI")!
        let task = session.dataTask(with: url, completionHandler: {data, response, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                do {
                    if let json: [String: Any] = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] {
                        let jsonDict = CEnumObj.shareInstance.covertToJSON(resultDict: json as NSDictionary)
                        let status = jsonDict.object(forKey: "status") as! String
                        print("status",status)
                        if status == "ZERO_RESULTS" {
                            DispatchQueue.main.async {
                                let alerts = UIAlertController(title: NSLocalizedString("dropLocText", comment: ""), message: NSLocalizedString("dropLocText", comment: ""), preferredStyle: .alert)
                                let ok = UIAlertAction(title: "OK", style: .default, handler: { alert in
                                    self.dismiss(animated: true, completion: nil)
                                })
                                alerts.addAction(ok)
                                self.present(alerts, animated: true, completion: nil)
                            }
                        }
                    }
                } catch {
                    
                }
            }
        })
        task.resume()
    }
}
