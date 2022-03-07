//
//  MapView.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 2/16/22.
//


import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject private var locationManager: LocationManager
    @StateObject private var viewModel = LocationMapViewModel()
    
    var body: some View {
       

        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .accentColor(Color(.systemPurple))
            
            VStack{
                Image("pvmap")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70) //come back to this change to right or left corner
                    .shadow(radius: 10)
                
                Spacer()
            }
        }
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .onAppear {
            if locationManager.locations.isEmpty {
            viewModel.getLocations(for: locationManager)
        }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(LocationManager())
    }
}
