//
//  ProfileView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 18/05/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var profileVm = ProfileViewModel()
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            LazyVStack {
                
                // Image, Name, Age, Ratings
                LazyVStack {
                    
                    if let imageUrl = profileVm.userData.status.imageUrl {
                        AsyncImage(url: imageUrl) { phase in
                            if let image = phase.image {
                                // Image from Api
                                image
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .clipShape(Circle())
                                    .padding(.top, 10)
                                
                             } else {
                                // Activity Indicator Till the icon is loading show
                                ProgressView()
                                    .frame(width: 120, height: 120)
                            }
                        }
                        
                    } else {
                        Image(systemName: AppConstants.AppImages.personCircle)
                            .resizable()
                            .frame(width: 120, height: 120)
                            .foregroundColor(.gray)
                            .padding(.top, 10)
                    }
                    
                    if let data = profileVm.userData.status.data {
                        
                        HStack {
                            
                            Text("\(data.firstName) \(data.lastName),")
                                .font(.headline)
                            
                            Text("\(profileVm.calculateAge(dob: data.dob))")
                                .font(.headline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.top, 5)
                        
                        HStack(spacing: 1) {
                            Text(String(format: "%.1f", data.averageRating))
                                .font(.subheadline)
                            Image(systemName: AppConstants.AppImages.star)
                                .font(.caption)
                        }
                        .foregroundColor(.secondary)
                        .bold()
                        
                        // Edit Pic and details
                        LazyVStack(alignment: .leading, spacing: 20) {
                            
                            Button {
                                // Navigate to EditProfilePicView
                            } label: {
                                Text(AppConstants.ButtonLabels.editprofilePic)
                                    .font(.subheadline)
                                    .bold()
                            }
                            
                            NavigationLink {
                                // Navigate to EditProfileView
                                EditProfileView(profileVm: profileVm)
                            } label: {
                                Text(AppConstants.ButtonLabels.editProfile)
                                    .font(.subheadline)
                                    .bold()
                            }
                            
                            Divider()
                        }
                        .padding(.top)
                        
                        // About You
                        if let bio = data.bio {
                            LazyVStack(alignment: .leading, spacing: 10) {
                                
                                Text(AppConstants.AppStrings.aboutYou)
                                    .padding(.top, 10)
                                    .font(.headline)
                                
                                Text(bio)
                                    .font(.subheadline)
                                    .multilineTextAlignment(.leading)
                                    .padding(.vertical, 10)
                                    .opacity(0.7)
                                    .bold()
                                
                                // Text("Travel Preferences")
                                
                                Divider()
                            }
                        }
                        
                        // Verify your profile
                        LazyVStack(alignment: .leading, spacing: 10) {
                            
                            Text(AppConstants.AppStrings.verifyYourProfile)
                                .padding(.top, 10)
                                .font(.headline)
                            
                            if data.activated != nil {
                                
                                ImageTitleView(
                                    title: data.email,
                                    image: AppConstants.AppImages.checkmarkCircle,
                                    color: .green)
                                .foregroundColor(.black.opacity(0.7))
                                .bold()
                                .padding(.top, 10)
                                
                            } else {
                                
                                NavigationLink {
                                    
                                } label: {
                                    ImageTitleView(
                                        title: AppConstants.ButtonLabels.confirmMyEmail + " " + data.email,
                                        image: AppConstants.AppImages.plus,
                                        color: .accentColor)
                                    .padding(.top, 10)
                                }
                            }
                            
                            if data.sessionKey != nil {
                                
                                ImageTitleView(
                                    title: data.phoneNumber,
                                    image: AppConstants.AppImages.checkmarkCircle,
                                    color: .green)
                                .foregroundColor(.black.opacity(0.7))
                                .bold()
                                .padding(.vertical, 10)
                                
                            } else {
                                
                                NavigationLink {
                                    
                                } label: {
                                    
                                    ImageTitleView(
                                        title: AppConstants.ButtonLabels.confirmMyPhone + " " + data.phoneNumber,
                                        image: AppConstants.AppImages.plus,
                                        color: .accentColor)
                                    .padding(.vertical, 10)
                                }
                            }
                            
                            Divider()
                        }
                        
                        // Vehicles
                        LazyVStack(alignment: .leading, spacing: 20) {
                            
                            Text(AppConstants.AppStrings.vehicles)
                                .font(.headline)
                                .padding(.top, 10)
                            
                            if !profileVm.vehicles.isEmpty {
                                
                                ForEach(profileVm.vehicles, id: \.self) { vehicle in
                                    ImageTitleView(title: vehicle, image: AppConstants.AppImages.car, color: .black)
                                        .bold()
                                        .opacity(0.6)
                                }
                                
                            }
                            
                            NavigationLink {
                                
                            } label: {
                                ImageTitleView(
                                    title: AppConstants.ButtonLabels.addVehicle,
                                    image: AppConstants.AppImages.plus,
                                    color: .accentColor)
                            }
                            
                            Divider()
                        }
                        
                        // Member Since
                        LazyVStack(alignment: .leading, spacing: 20) {
                            
                            Text(AppConstants.AppStrings.memberSince
                                 + " " +
                                 profileVm.memberSince(date: data.createdAt)
                            )
                                .font(.subheadline)
                                .opacity(0.6)
                                .bold()
                                .padding(.top, 10)
                            
                            Rectangle()
                                .foregroundColor(.gray.opacity(0.1))
                                .frame(height: 10)
                        }
                    }
                }
                
                LazyVStack(alignment: .leading, spacing: 15) {
                    NavigationLink {
                        
                    } label: {
                        ProfileRowView(title: AppConstants.AppStrings.ratings)
                    }
                    Divider()
                    
                    NavigationLink {
                        
                    } label: {
                        ProfileRowView(title: AppConstants.AppStrings.changePassword)
                    }
                    
                    Divider()
                    
                    Button {
                        
                    } label: {
                        Text(AppConstants.ButtonLabels.logOut)
                            .bold()
                    }
                }
                .padding(.vertical)
            }
            .padding()
        }
        .navigationTitle(AppConstants.AppHeadings.profile)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView()
        }
    }
}
