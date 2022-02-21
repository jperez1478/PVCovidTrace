//
//  pvCovidTraceApp.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 2/16/22.
//

import SwiftUI
import Firebase

@main
struct pvCovidTraceApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
           MainTabView()
        }
    }
}
