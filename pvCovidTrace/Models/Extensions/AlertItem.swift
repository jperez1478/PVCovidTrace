//
//  AlertItem.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 3/7/22.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK :  mAPvIEW eRRORS
    static let unableToGetLocations = AlertItem(title: Text("Locations Error"),
                                                message: Text("Unabler to retrieve locations at this time .\n Please try again."),
                                                dismissButton: .default(Text("Ok")))
}
