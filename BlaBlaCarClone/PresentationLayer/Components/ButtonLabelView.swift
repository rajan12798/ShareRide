//
//  ButtonView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 10/05/23.
//

import SwiftUI

struct ButtonLabelView: View {
    var buttonLabel: String
    
    var body: some View {
        
        Text(buttonLabel)
            .font(.headline)
            .padding(.vertical, 15)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            
    }
}

struct ButtonLabelView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabelView(buttonLabel: AppConstants.ButtonLabels.signUp)
    }
}
