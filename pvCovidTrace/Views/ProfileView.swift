//
//  ProfileView.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 2/17/22.
//


import SwiftUI

struct ProfileView: View {
    //MARK: -Properties
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var Classification = ""
    @State private var covidStatus = ""
        
    var body: some View {
        VStack {
            ZStack {
                Color(.secondarySystemBackground)
                    .frame(height: 130)
                    .cornerRadius(12)
                    .padding(.horizontal)
                
                HStack(spacing: 16){
                    ZStack {
                        AvatarView(size: 84)
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                            .foregroundColor(.white)
                            .offset(y: 30)
                    }
                    .padding(.leading, 12)
                    
                    VStack(spacing: 1) {
                        TextField("First Name", text: $firstName)
                            .font(.system(size: 32, weight: .bold))
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                        
                        TextField("Last Name", text: $lastName)
                            .font(.system(size: 32, weight: .bold))                            .font(.headline)
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                        
                        TextField("Classification", text: $Classification)
                            .font(.headline)
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                        
                    }
                    .padding(.trailing, 16) //padding for long names
                   
                }
                .padding()
        }
            VStack {
                Text("Current Status")
                
                TextEditor(text: $covidStatus)
                    .frame(width: 75, height: 50)
                    .overlay(RoundedRectangle(cornerRadius:8)
                                .stroke(Color.secondary,lineWidth: 1))
            }
            .padding(.horizontal,50)
        Spacer()
            
            Button {
            } label: {
                Text("Submit Status")
                    .bold()
                    .frame(width: 280, height: 44)
                    .background(Color.brandPrimary)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
                }
            }
    
    .navigationTitle("Profile")
        
    }
}


        
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
        }
        
    }
}
