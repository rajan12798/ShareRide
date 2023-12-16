//
//  SignUpHeadingview.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 11/05/23.
//

import SwiftUI

struct Headingview: View {
    
    var title: String
    
    var body: some View {
        
        Text(title)
            .font(.title)
            .opacity(0.9)
            .padding(.top, 30)
            .multilineTextAlignment(.center)
    }
}

struct SignUpHeadingview_Previews: PreviewProvider {
    static var previews: some View {
        Headingview(title: AppConstants.AppHeadings.whatsYourName)
    }
}
