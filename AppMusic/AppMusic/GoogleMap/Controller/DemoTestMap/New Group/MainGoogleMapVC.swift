//
//  MainGoogleMapVC.swift
//  AppMusic
//
//  Created by Boss on 10/15/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class MainGoogleMapVC: UIViewController, GMSMapViewDelegate {
    @IBOutlet weak var mapview: GMSMapView!
    
    var titleString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tao Map
        let camera = GMSCameraPosition.camera(withLatitude: 21.031494, longitude: 105.777015, zoom: 10)
        self.mapview.camera = camera
        addMarker()
        mapview.delegate = self
        mapview.settings.myLocationButton = true
        mapview.isMyLocationEnabled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.titleString = title
    }
    
    func addMarker() {
         let marker = GMSMarker()
         marker.position = CLLocationCoordinate2D(latitude: 21.031494, longitude: 105.777015)
         marker.title = "Trần Bình"
         marker.snippet = "Mai Dịch"
         marker.map = self.mapview
    }
    
    // tap vào 1 vị trí trên bản đồ sẽ lấy được location của vị trí đó lấy được long và lat
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        self.mapview.clear()
        self.addMarker(coordinate: coordinate)
    }

    
    func addMarker(coordinate: CLLocationCoordinate2D) {
         let marker = GMSMarker()
         marker.position = coordinate
         marker.map = self.mapview
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        //Your custom code here: for example get current location and then send it to your own server
        return false
    }

}
