//
//  CrossButton.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 19/05/23.
//

import SwiftUI

struct ImageButton: View {
    
    var image: String
    var action: () -> Void
    var body: some View {
        
        Button {
            action()
        }label: {
            Image(systemName: image)
        }
    }
}

struct CrossButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButton(image: AppConstants.AppImages.multiply) {
            print("text")
        }
    }
}
