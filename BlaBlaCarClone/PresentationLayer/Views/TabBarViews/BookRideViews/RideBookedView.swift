//
//  RideBookedView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 19/05/23.
//

import SwiftUI

struct RideBookedView: View {
    var body: some View {
        
        VStack {
            
            Image(AppConstants.AppImages.rideBook)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 250)
                .padding(.bottom, 50)
            
            Text(AppConstants.AppStrings.bookedRideMessage)
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Text(AppConstants.AppStrings.goToMyRides)
                .font(.headline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 4)
            
            Spacer()
            
            Button {
             // Pop to Home Screen
            } label: {
                
                Text(AppConstants.ButtonLabels.ok)
                    .font(.headline)
                    .padding(.vertical, 15)
                    .foregroundColor(.accentColor)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(18)
            }

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

struct RideBookedView_Previews: PreviewProvider {
    static var previews: some View {
        RideBookedView()
    }
}
