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
    
    var body: some View {
        //MARK: -Body
        ZStack {
            Map(coordinateRegion: $region)
                .ignoresSafeArea()
            VStack{
                Image("pvmap")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70) //come back to this change to right or left corner
                    .shadow(radius: 10)
                
                Spacer()
            }
            
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
