//
//  MainTabView.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 2/16/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NewsFeed()
                .tabItem {
                    Label("PV News", systemImage: "newspaper")
                }
            
                    
            MapView()
                .tabItem {
                    Label("Map", systemImage: "mappin.and.ellipse")
                        }
            LocationListView()
                .tabItem {
                    Label("Check in", systemImage: "person.fill.checkmark")
                }
           // NavigationView {
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
          //  }
        }
        .accentColor(.brandPrimary)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
