//
//  MapView.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 2/16/22.
//


import SwiftUI
import MapKit

struct MapView: View {
    //MARK: -Properties
    
    @StateObject private var viewModel = MapViewModel()
    //allows acces to my model in location manager
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 30.095264, longitude: -95.989301), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    @State private var alertItem : AlertItem?
    
    var body: some View {
        //MARK: -Body
        ZStack {
            Map(coordinateRegion: $region, showsUserLocation: true)
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
        .alert(item: $alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .onAppear {
            CloudKitManager.getLocations { result in
                switch result {
                case .success(let locations):
                    print(locations)
                case .failure(_):
                    alertItem = AlertContext.unableToGetLocations
                }
                
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
