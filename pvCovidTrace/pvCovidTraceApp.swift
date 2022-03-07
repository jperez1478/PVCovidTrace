//
//  pvCovidTraceApp.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 2/16/22.
//

import SwiftUI


@main
struct pvCovidTraceApp: App {
    
    let locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
           MainTabView()
                .environmentObject(locationManager)
        }
    }
}
