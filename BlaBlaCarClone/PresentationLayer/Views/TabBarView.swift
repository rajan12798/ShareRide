//
//  TabBarView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 18/05/23.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        
        TabView {
            
            BookRideView()
                .tabItem {
                    Label(AppConstants.ButtonLabels.search, systemImage: AppConstants.AppImages.magnifyingGlass)
                }
            
            PublishView()
                .tabItem {
                    Label(AppConstants.ButtonLabels.publish, systemImage: AppConstants.AppImages.publish)
                }
            
            MyRidesView()
                .tabItem {
                    Label(AppConstants.ButtonLabels.myRides, systemImage: AppConstants.AppImages.car)
                }
            
            InboxView()
                .tabItem {
                    Label(AppConstants.ButtonLabels.inbox, systemImage: AppConstants.AppImages.message)
                }
            
            ProfileView()
                .tabItem {
                    Label(AppConstants.ButtonLabels.profile, systemImage: AppConstants.AppImages.profile)
                        
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
