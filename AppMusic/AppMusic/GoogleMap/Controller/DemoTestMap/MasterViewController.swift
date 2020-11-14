//
//  MasterViewController.swift
//  AppMusic
//
//  Created by Boss on 10/16/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation

class MasterViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var locationImg: UIImageView!
    @IBOutlet weak var dropLocTextField: UITextField!
    @IBOutlet weak var pickLocTextField: UITextField!
    @IBOutlet weak var dropView: UIView!
    @IBOutlet weak var picView: UIView!
    @IBOutlet weak var btnRightNow: UIButton!
    
    var picLocation: CLLocationCoordinate2D?
    var dropLocation: CLLocationCoordinate2D?
    var isGesturePic = true
    var isAutoCompleCall = false
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        // hiện nút myLocationButton
        self.mapView.settings.myLocationButton = true
        initializeAuthention()
        dropView.layer.opacity = 0.5
        picView.layer.opacity = 1
        pickLocTextField.delegate = self
        dropLocTextField.delegate = self
        pickLocTextField.addTarget(self, action: #selector(picLocationPressed), for: .touchDown)
        dropLocTextField.addTarget(self, action: #selector(dropLocationPressed), for: .touchDown)
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        print("vE TRANG AN")
        return false
    }
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        print("LongPressAt", coordinate)
    }
    // 5
    @objc func picLocationPressed() {
        isGesturePic = true
        isAutoCompleCall = true
        locationImg.image = UIImage(named: "icons8-map_pin_filled")
        if picView.layer.opacity == 0.5 {
            dropView.layer.opacity = 0.5
            picView.layer.opacity = 1.0
            DispatchQueue.main.async {
                 CATransaction.begin()
                CATransition.setValue(1.5, forKey: kCATransactionAnimationDuration)
                let camera = GMSCameraPosition.camera(withLatitude: (self.picLocation?.latitude)!, longitude: (self.picLocation?.longitude)!, zoom: 18)
                self.mapView.camera = camera
                CATransaction.setCompletionBlock {
                    self.mapView.animate(to: camera)
                }
                CATransaction.commit()
            }
        } else {
            picView.layer.opacity = 1.0
            let autoCompleteVC = GMSAutocompleteViewController()
            autoCompleteVC.delegate = self
            let addressFilter = GMSAutocompleteFilter()
            addressFilter.type = .noFilter
            autoCompleteVC.autocompleteFilter = addressFilter
            present(autoCompleteVC, animated: true, completion: nil)
        }
    }
    
    @objc func dropLocationPressed() {
        isGesturePic = false
        isAutoCompleCall = true
        locationImg.image = UIImage(named: "icon_link_circle_picker_red")
        if dropView.layer.opacity == 0.5 {
            picView.layer.opacity = 0.5
            dropView.layer.opacity = 1.0
            if self.dropLocation != nil {
                DispatchQueue.main.async {
                    CATransaction.begin()
                    CATransition.setValue(1.5, forKey: kCATransactionAnimationDuration)
                    let camera = GMSCameraPosition.camera(withLatitude: (self.dropLocation?.latitude)!, longitude: (self.dropLocation?.longitude)!, zoom: 18)
                    self.mapView.camera = camera
                    CATransaction.setCompletionBlock {
                        self.mapView.animate(to: camera)
                    }
                    CATransaction.commit()
                }
            }
        } else {
            let autoCompleteVC = GMSAutocompleteViewController()
            autoCompleteVC.delegate = self
            let addressFilter = GMSAutocompleteFilter()
            addressFilter.type = .noFilter
            autoCompleteVC.autocompleteFilter = addressFilter
            present(autoCompleteVC, animated: true, completion: nil)
        }
    }
    
    // 2
    func initializeAuthention() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    // MARK: Delegate TextField
    // hàm kéo map
    func draggedToMapOnLoc(location: CLLocationCoordinate2D, isPic: Bool) {
        if isPic {
            locationImg.image = UIImage(named: "icons8-map_pin_filled")
        } else {
            locationImg.image = UIImage(named: "icon_link_circle_picker_red")
        }
        let camera = GMSCameraPosition.camera(withLatitude: location.latitude, longitude: location.longitude, zoom: 18)
        self.mapView.camera = camera
        self.mapView.animate(to: camera)
    }
    
    // lấy địa chỉ hiển thị lên textField
    func getlocationAddress(location: CLLocationCoordinate2D, text: UITextField) {
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(location, completionHandler: { reponse , error in
            if error == nil {
                if let places = reponse?.results() {
                    if let place = places.first {
                        if let line = place.lines {
                            let strArr = line.first?.components(separatedBy: ",")
                            text.text = "\(strArr![0]), \(strArr![1])"
                            //text.text = line.first
                        }
                    }
                }
            }
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case pickLocTextField:
            pickLocTextField.resignFirstResponder()
        default:
            dropLocTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case dropLocTextField:
            dropLocTextField.resignFirstResponder()
        default:
            pickLocTextField.resignFirstResponder()
        }
        return false
    }
    
    // 3.MARK: Location Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.mapView.isMyLocationEnabled = true
        let location = locations.last
        picLocation = CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        draggedToMapOnLoc(location: picLocation!, isPic: true)
        getlocationAddress(location: picLocation!, text: pickLocTextField)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    //MARK: Action
    @IBAction func btnRightNowTapped(_ sender: Any) {
        if (picLocation != nil) && (dropLocation != nil) {
            let vc = Storyboard.Main.rideNowViewController()
            vc.pickSource = picLocation
            vc.dropDestination = dropLocation
            vc.sourceStr = pickLocTextField.text
            vc.destinationStr = dropLocTextField.text
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            print("select your location...")
        }
    }
}
// 4 GMSMAP delegate
extension MasterViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        if !(isAutoCompleCall) {
            switch isGesturePic {
            case true:
                picLocation = position.target
                draggedToMapOnLoc(location: picLocation!, isPic: true)
                getlocationAddress(location: picLocation!, text: pickLocTextField)
                break
            default:
                dropLocation = position.target
                draggedToMapOnLoc(location: dropLocation!, isPic: true)
                getlocationAddress(location: dropLocation!, text: dropLocTextField)
            }
        }
    }
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        print("gesture=\(gesture)")
        if gesture {
            isAutoCompleCall = false
            if isGesturePic {
                pickLocTextField.text = "Đang tìm kiếm điểm đi..."
            } else {
                dropLocTextField.text = "Đang tìm kiếm điểm đến..."
            }
        }
    }
}

//6..MARK: GMSAutoCompleTeViewController Delegate

extension MasterViewController: GMSAutocompleteViewControllerDelegate {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        if isGesturePic {
            picLocation = CLLocationCoordinate2D(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
            draggedToMapOnLoc(location: picLocation!, isPic: true)
        } else {
            dropLocation = CLLocationCoordinate2D(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
            draggedToMapOnLoc(location: dropLocation!, isPic: false)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didSelect prediction: GMSAutocompletePrediction) -> Bool {
        print("prediction.attributedPrimaryText\(prediction.attributedPrimaryText)")
        if isGesturePic {
            print("prediction.attributedPrimaryText\(prediction.attributedPrimaryText)")
            pickLocTextField.attributedText = prediction.attributedPrimaryText
        } else {
            dropLocTextField.attributedText = prediction.attributedPrimaryText
        }
        return true
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        print("cancel")
        dismiss(animated: true, completion: nil)
    }
    
    
}
