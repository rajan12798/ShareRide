//
//  detailView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 19/05/23.
//

import SwiftUI

struct DetailView: View {
    
    var image: String
    var text: String
    
    var body: some View {
        
        HStack {
            Image(systemName: image)
            Text(text)
        }
        .opacity(0.7)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: AppConstants.AppImages.calendar, text: "Day, date")
    }
}
