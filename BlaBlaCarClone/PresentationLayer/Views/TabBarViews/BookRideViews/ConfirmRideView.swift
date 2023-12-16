//
//  ConfirmRideView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 19/05/23.
//

import SwiftUI

struct ConfirmRideView: View {
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        VStack {
            
            Rectangle()
                .foregroundColor(.gray.opacity(0.1))
                .frame(height: 10)
            
            ScrollView(showsIndicators: false) {
                
                LazyVStack(alignment: .leading) {
                    
                    // Trip Info
                    VStack(alignment: .leading, spacing: 12) {
                        
                        DetailView(
                            image: AppConstants.AppImages.calendar,
                            text: "Day, Date")
                        
                        DetailView(image: AppConstants.AppImages.clock, text: "Ride duration (Estimated)")
                        
                        DetailView(image: AppConstants.AppImages.distance, text: "Ride distance")
                    }
                    .padding()
                    
                    Divider()
                    
                    // PickUp drop location
                    HStack(spacing: 16) {
                        
                        CustomShape()
                            .stroke(Color.black, lineWidth: 1)
                            .frame(maxWidth: 10)
                            .padding(.bottom, 75)
                        
                        VStack(alignment: .leading) {
                            
                            RideDetailComponent(
                                title: "PickUp Location",
                                subTitle: "Detailed location",
                                time: "Time",
                                distance: "distance from your pickup location",
                                onConfirmRide: true)
                            
                            .padding(.bottom)
                            
                            RideDetailComponent(
                                title: "Drop Location",
                                subTitle: "Detailed location",
                                time: "Time",
                                distance: "distance from your drop location",
                                onConfirmRide: true)
                            
                            .padding(.top)
                        }
                    }
                    .padding()
                    
                    Divider()
                    
                    // Driver Profile
                    VStack(alignment: .leading, spacing: 24) {
                        
                        NavigationLink {
                            // Go to DriverProfileView
                        }label: {
                            
                            HStack(spacing: 12) {
                                
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.gray)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    Text("Arjun singh")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    
                                    HStack(spacing: 4) {
                                        Text("4.5")
                                        Image(systemName: AppConstants.AppImages.star)
                                        Text("27 Ratings")
                                    }
                                    .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                Image(systemName: AppConstants.AppImages.chevronRight)
                                    .foregroundColor(.black)
                            }
                        }
                        
                        HStack {
                            Image(systemName: AppConstants.AppImages.car)
                                .font(.headline)
                                .opacity(0.7)
                            
                            Text("Car Name (Color)")
                                .font(.headline)
                                .opacity(0.7)
                            
                        }
                        
                    }
                    .padding()
                    
                    Divider()
                    
                    // Seat and Price
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(AppConstants.AppStrings.bookedSeats)
                                .font(.subheadline)
                                .bold()
                                .opacity(0.7)
                            
                            Spacer()
                            
                            Text("x2")
                        }
                        
                        HStack {
                            Text(AppConstants.AppStrings.totalAmount)
                                .font(.headline)
                            
                            Spacer()
                            
                            Text("Rs 240.00")
                        }
                    
                    }
                    .padding()
                }
                
            }
            
            // Confirm Button
            NavigationLink {
                // Navigate
                RideBookedView()
            } label: {
                ButtonLabelView(buttonLabel: AppConstants.ButtonLabels.confirmRide)
                    .cornerRadius(20)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                TitleView(title: AppConstants.AppHeadings.confirmRide)
            }
        }
    }
}

struct ConfirmRideView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ConfirmRideView()
        }
    }
}
