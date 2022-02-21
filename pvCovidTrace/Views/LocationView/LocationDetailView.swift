//
//  LocationDetailView.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 2/16/22.
//


import SwiftUI

struct LocationDetailView: View {
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())
                   
    ]
    var body: some View {
        VStack{
            Image("og")
                .resizable()
                .scaledToFit()
                .frame(height: 150)
            HStack {
                Label("240 E M Norris St, Prairie View, TX 77446", systemImage: "mappin.and.ellipse")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding(.horizontal)
            
            Text("This will be the check in for this location , this is just a test description")
                .lineLimit(3)
                .minimumScaleFactor(0.75)
                .frame(height: 70)
                .padding(.horizontal)
            //button check in
            ZStack {
                Capsule()
                    .frame(height: 80)
                    .foregroundColor(Color(.secondarySystemBackground))
                HStack(spacing: 30) {
                    Button {
                    } label : {
                        LoadActionButton(color: .brandPrimary, imageName: "location.fill")
                    }
                    Link(destination: URL(string: "https://pvamu.co1.qualtrics2.com/jfe/form/SV_8w9tG1p7X4jADQ2")!, label: {
                        LoadActionButton(color: .brandPrimary, imageName: "network")
                    })
                    
                    Button {
                    } label: {
                        LoadActionButton(color: .brandPrimary, imageName: "phone.fill")
                    }
                    
                    Button {
                    } label : {
                        LoadActionButton(color: .brandPrimary, imageName: "person.fill.checkmark")
                    }
                    
                }
            }
            .padding(.horizontal)
            
            
            Text("Recently checked in people ")
                .bold()
                .font(.title2)
            
            //vgrid to show checked in ppl
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    FirstNameAvatarView(firstname: " Sean")
                    FirstNameAvatarView(firstname: "katie")
                    FirstNameAvatarView(firstname: "kelly")
                    FirstNameAvatarView(firstname: "jessica")
                    FirstNameAvatarView(firstname: "katerra")
                    
                    
                })
            }
          
            
            
            Spacer()
        }
        .navigationTitle("University View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocationDetailView()
        }
      
.previewInterfaceOrientation(.portrait)
    }
}

//struct for my avatar
struct AvatarView: View {
    
var size: CGFloat
    
var body: some View {
    Image("user2")
        .resizable()
        .scaledToFit()
        .frame(width: size, height: size)
        .clipShape(Circle())
    }
}
//struct for the load action Button
struct LoadActionButton: View {
    var color: Color
    var imageName: String
    
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: 60, height: 60)
            Image(systemName: imageName)
                .resizable()
                .foregroundColor(.white)
                .frame(width: 22, height: 22)
        }
    }
}

struct FirstNameAvatarView: View {
    
    var firstname: String
    
    var body: some View {
        VStack {
            AvatarView(size: 64)
            
            Text(firstname)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.75)
        }
    }
}
