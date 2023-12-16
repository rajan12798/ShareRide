//
//  CarRidesListView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 17/05/23.
//

import SwiftUI

struct CarRideCardView: View {
    
    @StateObject var cardVm = CarRideCardViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack(spacing: 10) {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Dep Time")
                        .font(.headline)
                    Text("Time Taken")
                        .font(.caption)
                    Spacer()
                    
                    Text("Arr Time")
                        .font(.headline)
                        .padding(.bottom, 50)
                }
                
                CustomShape()
                    .stroke(Color.black, lineWidth: 3)
                    .frame(maxWidth: 10)
                    .padding(.bottom, 55)
                
                VStack(alignment: .leading, spacing: 10) {
                    CarLocationView(
                        title: "Pickup Location",
                        colour: cardVm.colorCodeDist(
                            distance: cardVm.depDist),
                        distance: cardVm.depDist)
                    
                    Spacer()
                    
                    CarLocationView(
                        title: "Drop Location",
                        colour: cardVm.colorCodeDist(
                            distance: cardVm.arrDist),
                        distance: cardVm.arrDist)
                }
                
                Spacer()
                
                VStack(spacing: 10) {
                    Text("Price")
                        .font(.headline)
                    Text("Seats Left")
                    Spacer()
                }
            }
            
            Divider()
            
            HStack {
              
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("User Name")
                    
                    HStack {
                        Image(systemName: AppConstants.AppImages.star)
                            .opacity(0.6)
                        Text("Rating")
                    }
                    
                }
                
                Spacer()
                
                if true {
                    Image(systemName: AppConstants.AppImages.bolt)
                        .font(.title2)
                        .opacity(0.8)
                }
                
            }
            .padding(.top, 10)
        }
        .padding()
        .frame(maxWidth: UIScreen.main.bounds.width - 50)
        .background(.white)
        .cornerRadius(20)
        .shadow(color: Color.gray, radius: 2)
        
    }
}

struct CarRidesListView_Previews: PreviewProvider {
    static var previews: some View {
        CarRideCardView()
    }
}
