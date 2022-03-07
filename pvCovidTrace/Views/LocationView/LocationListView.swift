//
//  LocationListView.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 2/16/22.
//


import SwiftUI

struct LocationListView: View {
    @State private var locations: [PVLocations] = [PVLocations(record: MockData.location)]
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(locations, id: \.ckRecordID) { location  in
                    NavigationLink(destination: LocationDetailView()) {
                        LocationCell(location: location)
                    }
                }
            }
            .navigationTitle("Campus Locations")
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}
