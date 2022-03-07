//
//  LocationManager.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 3/7/22.
//

import Foundation
final class LocationManager: ObservableObject {
    @Published var locations: [PVLocations] = []
}

