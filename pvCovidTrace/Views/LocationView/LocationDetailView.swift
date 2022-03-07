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
                   GridItem(.flexible())]
    
    var location: PVLocations
    
    var body: some View {
        VStack(spacing: 16){
            BannerImageView(image: location.createBannerImage())
            
            HStack {
                AdressView(adress: location.adresss)
                Spacer()
            }
            .padding(.horizontal)
            
            DescriptionView(text: location.description)
            
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
        .navigationTitle(location.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocationDetailView(location: PVLocations(record: MockData.location))
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
struct BannerImageView: View {
    
    var image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .frame(height: 120)
    }
}

struct AdressView: View {
    var adress: String
    
    var body: some View {
        Label(adress, systemImage: "mapping.and.ellipse")
    }
}

struct DescriptionView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .lineLimit(3)
            .minimumScaleFactor(0.75)
            .frame(height: 70)
            .padding(.horizontal)
    }
}
