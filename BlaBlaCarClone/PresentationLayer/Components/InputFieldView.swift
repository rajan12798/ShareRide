//
//  InputFieldView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 10/05/23.
//

import SwiftUI

struct InputFieldView: View {
    
    var placeholder: String
    var textInputAutocapitalization: TextInputAutocapitalization = .never
    var keyBoardType: UIKeyboardType = .default
    @Binding var textFieldValue: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(placeholder)
                .font(.subheadline)
            
            if placeholder == AppConstants.AppStrings.password ||
                placeholder == AppConstants.AppStrings.confirmPassword {
                
                SecureInputView(placeholder, text: $textFieldValue)
                    .padding(12)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
            } else {
                TextField(placeholder, text: $textFieldValue)
                    .padding(12)
                    .background(Color.gray.opacity(0.1))
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(textInputAutocapitalization)
                    .keyboardType(keyBoardType)
                    .cornerRadius(12)
            }
        }
    }
}

struct InputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InputFieldView(placeholder: AppConstants.AppStrings.email, textFieldValue: Binding.constant(String()))
    }
}
