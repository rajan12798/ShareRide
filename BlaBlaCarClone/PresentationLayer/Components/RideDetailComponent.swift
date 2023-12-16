//
//  RideDetailComponent.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 19/05/23.
//

import SwiftUI

struct RideDetailComponent: View {
    var title: String
    var subTitle: String
    var time: String
    var distance: String
    var onConfirmRide: Bool
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(title)
                    .font(.headline)
                Text(subTitle)
                    .font(.subheadline)
                    .opacity(0.7)
                Text(time)
                    .font(.subheadline)
                    .opacity(0.7)
                
                HStack {
                    Image(systemName: AppConstants.AppImages.walkingFigure)
                    // Change color accordingly
                        .foregroundColor(.gray)
                    
                    Text(distance)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 4)
            }
            
            Spacer()
            
            if !onConfirmRide {
                Image(systemName: AppConstants.AppImages.chevronRight )
            }
        }
        .foregroundColor(.black)
    }
}

struct RideDetailComponent_Previews: PreviewProvider {
    static var previews: some View {
        RideDetailComponent(title: "PickUp Location",
                            subTitle: "Detailed Location",
                            time: "Time",
                            distance: "distance from your pick up location",
                            onConfirmRide: false)
    }
}
