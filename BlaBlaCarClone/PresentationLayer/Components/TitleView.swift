//
//  NavigationView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 19/05/23.
//

import SwiftUI

struct TitleView: View {
    
    @Environment (\.dismiss) var dismiss
    var title: String
    
    var body: some View {
        
        HStack {
            ImageButton(image: AppConstants.AppImages.chevronleft) {
                self.dismiss()
            }
            .font(.headline)
            .foregroundColor(.black)
            
            Text(title)
                .font(.title3)
                .bold()
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: AppConstants.AppHeadings.confirmRide)
    }
}
