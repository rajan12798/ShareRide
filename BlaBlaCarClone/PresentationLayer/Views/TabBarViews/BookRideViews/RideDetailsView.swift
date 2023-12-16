//
//  RideDetailsView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 19/05/23.
//

import SwiftUI

struct RideDetailsView: View {
    
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
                        
                        Text(AppConstants.AppHeadings.tripInfo)
                            .font(.headline)
                            .padding(.bottom)
                        
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
                            
                            NavigationLink {
                                // TODO: - Add Map View
                            } label: {
                                
                                RideDetailComponent(
                                    title: "PickUp Location",
                                    subTitle: "Detailed location",
                                    time: "Time",
                                    distance: "distance from your pickup location",
                                    onConfirmRide: false)
                            }
                            .padding(.bottom)
                            
                            NavigationLink {
                                // TODO: - Add Map View
                            } label: {
                                
                                RideDetailComponent(
                                    title: "Drop Location",
                                    subTitle: "Detailed location",
                                    time: "Time",
                                    distance: "distance from your drop location",
                                    onConfirmRide: false)
                                
                            }
                            .padding(.top)
                        }
                    }
                    .padding()
                    
                    Divider()
                    
                    // Seat and Price
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(AppConstants.AppStrings.seatsLeft)
                                .font(.headline)
                                .opacity(0.7)
                            
                            Spacer()
                            
                            Text("2")
                        }
                        
                        HStack {
                            Text(AppConstants.AppStrings.pricePerSeat)
                                .font(.headline)
                                .opacity(0.7)
                            
                            Spacer()
                            
                            Text("Rs 240.00")
                            
                        }
                        
//                        Text(AppConstants.AppStrings.payVia)
//                            .font(.caption)
//                            .foregroundColor(.gray)
                    }
                    .padding()
                    
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.1))
                        .frame(height: 10)
                    
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
                            
                            Spacer()
                            
                            Button {
                                // Add action
                            }label: {
                                Text("\(AppConstants.ButtonLabels.contact) Arjun")
                                    .font(.headline)
                            }
                        }
                        
                    }
                    .padding()
                    
                    Divider()
                    
                    // Ride Preferences
                    VStack(alignment: .leading) {
                        
                        Text(AppConstants.AppHeadings.ridePreferences)
                            .font(.headline)
                        Text("all amenities allowed")
                    }
                    .padding()
                    
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.1))
                        .frame(height: 50)
                }
                
            }
            
            // Continue Button
            NavigationLink {
                // Navigate
                ConfirmRideView()
            } label: {
                ButtonLabelView(buttonLabel: AppConstants.ButtonLabels.contnue)
                    .cornerRadius(20)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                TitleView(title: AppConstants.AppHeadings.rideDetails)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Text(AppConstants.ButtonLabels.report)
                        .font(.headline)
                }
                
            }
        }
    }
}

struct RideDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RideDetailsView()
        }
    }
}
