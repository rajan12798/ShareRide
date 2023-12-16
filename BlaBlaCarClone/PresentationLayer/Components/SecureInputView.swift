//
//  SecureInputView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 11/05/23.
//

import SwiftUI

struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                } else {
                    TextField(title, text: $text)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                }
            }
            .padding(.trailing, 32)
            
            ImageButton(image: self.isSecured ?  AppConstants.AppImages.eyeSlash: AppConstants.AppImages.eye) {
                isSecured.toggle()
            }
            .foregroundColor(.gray)
        }
    }
}

struct SecureInputView_Previews: PreviewProvider {
    static var previews: some View {
        SecureInputView(String(), text: Binding.constant(String()))
    }
}
