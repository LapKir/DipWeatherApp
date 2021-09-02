//
//  CLLocation.swift
//  DipWeatherApp
//
//  Created by Cyril on 2.09.21.
//

import Foundation
import CoreLocation

extension ForecastViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            currentLocation = location
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
