//
//  LocationMapvIiewModel.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 3/7/22.
//

import MapKit

final class LocationMapViewModel: ObservableObject {
    
    @Published var alertItem : AlertItem?
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 30.095264, longitude: -95.989301), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
   
    
    func getLocations(for locationManager: LocationManager) {
        CloudKitManager.getLocations { [self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let locations):
                        locationManager.locations = locations
                    case .failure(_):
                        alertItem = AlertContext.unableToGetLocations
                }
            }
        }
    }
}
