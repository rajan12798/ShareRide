//
//  ImageTitleView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 23/05/23.
//

import SwiftUI

struct ImageTitleView: View {
    
    var title: String
    var image: String
    var color: Color
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(color)
            
            Text(title)
                .font(.subheadline)
                .bold()
        }
    }
}

struct ImageTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ImageTitleView(title: String(), image: AppConstants.AppImages.checkmarkCircle, color: .green)
    }
}
