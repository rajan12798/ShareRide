//
//  HomeView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 12/05/23.
//

import SwiftUI

struct BookRideView: View {
    
    @StateObject var bookRideVm = BookRideViewModel()
    
    var body: some View {
        
        ZStack {
            
            // Background Image
            VStack {
                Image(AppConstants.AppImages.carpool)
                    .ignoresSafeArea()
                    .frame(maxHeight: 400)
                
                Spacer()
            }
            .background(.white)
            
            // Main Box
            VStack {
                
                VStack {
                    
                    ZStack(alignment: .leading) {
                        
                        VStack {
                            
                            HomeScreenComponent(
                                title: bookRideVm.startlocation,
                                image: AppConstants.AppImages.largeCircle,
                                isPresented: $bookRideVm.isSearchPresented,
                                type: .leavingFrom)
                            
                            Divider()
                            
                            HomeScreenComponent(
                                title: bookRideVm.destination,
                                image: AppConstants.AppImages.largeCircle,
                                isPresented: $bookRideVm.destSearchPresented,
                                type: .goingTo)
                        }
                        
                        if !bookRideVm.startlocation.isEmpty ||  !bookRideVm.destination.isEmpty {
                        
                            Button {
                                swap(&bookRideVm.startlocation, &bookRideVm.destination)
                            }label: {
                                Image(systemName: AppConstants.AppImages.upDownArrow)
                                    .font(.title)
                                    .background(Color.white)
                            }
                            .padding(.leading, 8)
                        }
                    }
                                
                    Divider()
                    
                    HStack {
                        
                        HomeScreenComponent(
                            title: bookRideVm.formatDate(),
                            image: AppConstants.AppImages.calendar,
                            isPresented: $bookRideVm.isCalenderPresented,
                            type: .date)
                        
                        .frame(width: 200)
                        
                        Divider()
                        
                        HomeScreenComponent(
                            title: String(bookRideVm.noOfSeats),
                            image: AppConstants.AppImages.person,
                            isPresented: $bookRideVm.isSeatsPresented,
                            type: .seats)
                    }
                    .frame(maxHeight: 40)
                    
                }
                .padding()
                
                // Search button
                NavigationLink {
                    // Navigate to View Showing car rides based on search
                    CarRideListView(homeVm: bookRideVm)
                }label: {
                    ButtonLabelView(buttonLabel: AppConstants.ButtonLabels.search)
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width - 50, maxHeight: 260)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: Color.gray, radius: 2)
            .navigationBarBackButtonHidden(true)
        }
        // On click search location is presented
        .fullScreenCover(isPresented: $bookRideVm.isSearchPresented, content: {
            SearchLocationview(address: $bookRideVm.startlocation)
        })
        // On click search location is Presented
        .fullScreenCover(isPresented: $bookRideVm.destSearchPresented, content: {
            SearchLocationview(address: $bookRideVm.destination)
        })
        // On click calendar is presented
        .fullScreenCover(isPresented: $bookRideVm.isCalenderPresented, content: {
            SelectDateView(date: $bookRideVm.date)
        })
        // On click seatsView is presented
        .fullScreenCover(isPresented: $bookRideVm.isSeatsPresented, content: {
            SeatsView(noOfSeats: $bookRideVm.noOfSeats)
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BookRideView()
        }
    }
}
