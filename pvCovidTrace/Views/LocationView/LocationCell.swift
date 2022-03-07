//
//  LocationCell.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 2/21/22.
//

import SwiftUI

struct  LocationCell: View {
    var location: PVLocations
    
    var body: some View {
        HStack {
            Image(uiImage: location.createSquareImage())
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.vertical, 8) //space
            
            
            VStack {
                Text(location.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
        
        }
        .padding(.leading)
    }
    }
struct LocationCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationCell(location: PVLocations(record: MockData.location))
    }
}
