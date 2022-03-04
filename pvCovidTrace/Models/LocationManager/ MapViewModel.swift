//
//   MapViewModel.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 2/17/22.
//

import MapKit
import SwiftUI


final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager? //optional because a user can turn off Location Services for the whole phone
    
    //function to check if location on
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.delegate = self 
          locationManager?.activityType = .airborne
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            
        } else {
            print("Show alert here to know is off and turn it off")
        }
    }
    
  private func checkLocationAuthorization() {
        //wrap in optional so we can use the location manager in the scope of this fucntion
        guard let locationManager = locationManager else {return }
        
        //location Authorization
        //All cases to be handled
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization() //when in our app
        case .restricted:
            print("show alert , parental controls ") //crerate a window for this error message
        case .denied:
            print("You have denied acces") //create another pop up error message
        case .authorizedAlways, .authorizedWhenInUse:
            break //will vbisit this back 
        @unknown default:
            break
        }
    }
    
    ////The system calls the delegate’s locationManagerDidChangeAuthorization(_:) method immediately when you create a location manager, and again when the app’s authorization changes. The delegate handles all location and heading-related updates and events.

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        //checklocations
        checkLocationAuthorization()
    }
}
