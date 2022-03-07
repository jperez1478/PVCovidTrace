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
    
    @Published var locations: [PVLocations] = []
    
    func getLocations() {
        CloudKitManager.getLocations { [self] result in
            switch result {
            case .success(let locations):
                self.locations = locations
            case .failure(_):
                alertItem = AlertContext.unableToGetLocations
            }
        }
    }
    
}
