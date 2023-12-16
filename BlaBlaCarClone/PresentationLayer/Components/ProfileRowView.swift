//
//  ProfileRowView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 23/05/23.
//

import SwiftUI

struct ProfileRowView: View {
    
    var title: String
    
    var body: some View {
        
        HStack {
            Text(title)
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: AppConstants.AppImages.chevronRight)
                .foregroundColor(.black)
        }
    }
}

struct ProfileRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRowView(title: String())
    }
}
