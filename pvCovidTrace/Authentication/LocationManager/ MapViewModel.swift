//
//   MapViewModel.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 2/17/22.
//

import MapKit
import SwiftUI


final class MapViewModel: ObservableObject {
    
    var locationManager: CLLocationManager? //optional because a user can turn off Location Services for the whole phone
    
    //function to check if location on
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.activityType = .airborne
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("Show alert here to know is off and turn it off")
        }
    }
    
    func checkLocationAuthorization() {
        //wrap in optional so we can use the location manager in the scope of this fucntion
        guard let locationManager = locationManager else {return }
        
        //location Authorization
        //All cases to be handled 
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            <#code#>
        case .restricted:
            <#code#>
        case .denied:
            <#code#>
        case .authorizedAlways:
            <#code#>
        case .authorizedWhenInUse:
            <#code#>
        @unknown default:
            <#code#>
        }
        
        
        
    }
}
