//
//  HoneScreenComponent.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 12/05/23.
//

import SwiftUI

struct HomeScreenComponent: View {
    
    var title: String
    var image: String
    @Binding var isPresented: Bool
    var type: HomeScreenFieldTypes
    
    var body: some View {
        
        Button(action: {
            isPresented = true
        }, label: {
            HStack {
                Image(systemName: image)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                if title.isEmpty {
                    if type == .leavingFrom {
                        Text(AppConstants.AppStrings.leavingFrom)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    } else if type == .goingTo {
                        Text(AppConstants.AppStrings.goingTo)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                } else {
                    Text(title)
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
        })
    }
}

struct HoneScreenComponent_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenComponent(title: AppConstants.AppStrings.leavingFrom,
                            image: AppConstants.AppImages.largeCircle,
                            isPresented: Binding.constant(false),
                            type: .leavingFrom)
    }
}
