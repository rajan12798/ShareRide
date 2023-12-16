//
//  ProgressBarView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 10/05/23.
//

import SwiftUI

struct ProgressBarView: View {
    
    var currentValue: Float
    var totalValue: Float
    
    var body: some View {
        
        ProgressView(value: currentValue, total: totalValue, label: {
            
        Text("\(AppConstants.AppStrings.step) \(Int(currentValue)) \(AppConstants.AppStrings.of) \(Int(totalValue))")
                .font(.subheadline)
        })
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(currentValue: 1, totalValue: 5)
    }
}
