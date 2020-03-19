//
//  LocationModel.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 14.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import Foundation
import Combine
import CoreLocation

class LocationViewModel: NSObject, ObservableObject{
  
    @Published var userLatitude: Double? = nil
    @Published var userLongitude: Double? = nil 
  
  private let locationManager = CLLocationManager()
  
  override init() {
    super.init()
    self.locationManager.delegate = self
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    self.locationManager.requestWhenInUseAuthorization()
    self.locationManager.activityType = .airborne
    self.start()
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
  
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        userLatitude = location.coordinate.latitude
        userLongitude = location.coordinate.longitude
        print(location)
    }
    func start(){
        print("location start")
        self.locationManager.startUpdatingLocation()
    }
    
    func stop(){
        print("location stop")
        self.locationManager.stopUpdatingLocation()
    }
}
