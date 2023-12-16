//
//  CarLocationView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 17/05/23.
//

import SwiftUI

struct CarLocationView: View {
    
    var title: String
    var colour: Color
    var distance: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .lineLimit(3, reservesSpace: false)
                .multilineTextAlignment(.leading)
                .font(.headline)
            
            HStack {
                Image(systemName: AppConstants.AppImages.walkingFigure)
                    .font(.headline)
                    .foregroundColor(colour)
                
                Text("\(distance) km")
                    .font(.caption)
            }
        }
    }
}

struct CarLocationView_Previews: PreviewProvider {
    static var previews: some View {
        CarLocationView(title: "PickUp Location", colour: .gray, distance: 0)
    }
}
