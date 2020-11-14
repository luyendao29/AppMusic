//
//  RideNowViewController.swift
//  AppMusic
//
//  Created by Boss on 10/16/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation

class RideNowViewController: UIViewController {
    @IBOutlet weak var pickTextFields: UITextField!
    @IBOutlet weak var dropTextFields: UITextField!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    var pickSource: CLLocationCoordinate2D?
    var dropDestination: CLLocationCoordinate2D?
    var sourceStr: String?
    var destinationStr: String?
    var path = GMSPath()
    var timeRouter: Timer?
    var animationPolyline = GMSPolyline()
    var animationPath = GMSMutablePath()
    var i: UInt = 0
    var bounds = GMSCoordinateBounds()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myRideDisPlay()
        self.navigationController?.navigationBar.isHidden = false
    }
    

    func myRideDisPlay() {
        if pickSource != nil && dropDestination != nil {
            self.pickTextFields.text = sourceStr!
            self.dropTextFields.text! = destinationStr!
            
            CATransaction.begin()
            CATransaction.setValue(1.5, forKey: kCATransactionAnimationDuration)
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: (self.pickSource?.latitude)!, longitude: (self.pickSource?.longitude)!)
            marker.map = self.mapView
            marker.icon = UIImage(named: "icons8-location_filled_or")
            self.bounds = self.bounds.includingCoordinate(marker.position)
            CATransaction.commit()
            
            do {
                getPolylineRoute(from: pickSource!, to: dropDestination!)
            }
        }
    }
}
