//
//  CarRideListView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 17/05/23.
//

import SwiftUI

struct CarRideListView: View {
    
    @ObservedObject var homeVm: BookRideViewModel
    @State private var isPresented: Bool = false
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // NavigationView
            HStack(alignment: .top, spacing: 10) {
                
                // Back button
                ImageButton(image: AppConstants.AppImages.chevronleft) {
                    dismiss()
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack(alignment: .top) {
                        
                        Text(homeVm.startlocation)
                            .font(.subheadline)
                        
                        Image(systemName: AppConstants.AppImages.arrow)
                            .font(.subheadline)
                        
                        Text(homeVm.destination)
                            .font(.subheadline)
                    }
                        
                    Text("\(homeVm.formatDate()), \(homeVm.noOfSeats) \(AppConstants.AppStrings.passenger)")
                            .font(.caption)
                    
                }
                
                Spacer()
                
                // Filter button
                Button {
                    // to present filter view
                    self.isPresented.toggle()
                }label: {
                    Text(AppConstants.ButtonLabels.filter)
                        .font(.headline)
                }
                
            }
            .foregroundColor(.white)
            .padding(20)
            .frame(maxWidth: .infinity, maxHeight: 60)
            .background(Color.accentColor)
        
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 10) {
                    ForEach(0..<10) {_ in
                        NavigationLink {
                            RideDetailsView()
                        }label: {
                            CarRideCardView()
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .fullScreenCover(isPresented: $isPresented, content: {
            FilterView()
        })
        
    }
}

struct CarRideListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CarRideListView(homeVm: BookRideViewModel())
        }
    }
}
