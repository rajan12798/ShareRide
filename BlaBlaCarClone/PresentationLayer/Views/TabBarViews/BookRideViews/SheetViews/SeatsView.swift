//
//  SeatsView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 16/05/23.
//

import SwiftUI

struct SeatsView: View {
    
    @Environment (\.dismiss) var dismiss
    @Binding var noOfSeats: Int
    @State private var seatsCount: Int = 1
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                ImageButton(image: AppConstants.AppImages.multiply) {
                    self.dismiss()
                }
                .font(.title2)
                
                Spacer()
                
                Button(action: {
                    noOfSeats = seatsCount
                    self.dismiss()
                }, label: {
                    Text(AppConstants.ButtonLabels.done)
                        .font(.title3)
                })
            }

            Headingview(title: AppConstants.AppHeadings.noOfSeats)
                .padding(.bottom, 30)
            
            HStack {
                
                ImageButton(image: AppConstants.AppImages.minus) {
                    seatsCount -= 1
                }
                .font(.largeTitle)
                .disabled(seatsCount == 1)
                
                Spacer()
                
                Text("\(seatsCount)")
                    .font(.system(size: 48))
                    
                Spacer()
                
                ImageButton(image: AppConstants.AppImages.plus) {
                    seatsCount += 1
                }
                .font(.largeTitle)
                .disabled(seatsCount == 8)
            }
            
            Spacer()
            
        }
        .padding()
        .onAppear {
            seatsCount = noOfSeats
        }
        
    }
}

struct SeatsView_Previews: PreviewProvider {
    static var previews: some View {
        SeatsView(noOfSeats: Binding.constant(1))
    }
}
