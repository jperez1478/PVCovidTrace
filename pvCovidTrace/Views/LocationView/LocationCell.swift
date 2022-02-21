//
//  LocationCell.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 2/21/22.
//

import SwiftUI

struct  LocationCell: View {
    
    var body: some View {
        HStack {
            Image("pvVillage")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.vertical, 8) //space
            
            
            VStack {
                Text("Test Location Name")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
        
        }
        .padding(.leading)
    }
    }

