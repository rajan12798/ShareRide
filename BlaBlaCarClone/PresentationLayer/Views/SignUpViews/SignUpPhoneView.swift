//
//  SwiftUIView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 11/05/23.
//

import SwiftUI

struct SignUpPhoneView: View {
    
    @ObservedObject var vm: SignUpViewModel
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            ProgressBarView(currentValue: vm.totalValue, totalValue: vm.totalValue)
            
            Headingview(title: AppConstants.AppHeadings.enterPhone)
            
            InputFieldView(
                placeholder: AppConstants.AppStrings.phoneNumber,
                keyBoardType: .phonePad,
                textFieldValue: $vm.phoneNumber)
            
                .padding(.top, 25)
                .onChange(of: vm.phoneNumber, perform: {_ in
                    vm.validPhone()
                })
            
            if vm.phonePrompt {
                Text(vm.phoneMessage)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(5)
            }
        
//            iPhoneNumberField(AppConstants.AppStrings.phoneNumber,text: $vm.phoneNumber)
//                .flagHidden(false)
//                .flagSelectable(true)
//                .maximumDigits(10)
//                .defaultRegion(AppConstants.AppStrings.countryRegion)
//                .padding()
//                .background(Color.gray.opacity(0.2))
//                .keyboardType(.phonePad)
//                .padding(.top, 25)
            
            Spacer()
            
            if vm.isLoading {
                ProgressView()
                    .padding(.bottom, 20)
            }
            
            // SignUp Button
            Button {
                vm.signUp()
            } label: {
                ButtonLabelView(buttonLabel: AppConstants.ButtonLabels.signUp)
                    .cornerRadius(18)
            }
            .opacity(vm.disableSignUpbtn() ? 0.5 : 1)
            .disabled(vm.disableSignUpbtn())
            
        }
        .padding()
        .navigationTitle(AppConstants.AppHeadings.finishSignUp)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $vm.signUpActive, destination: {
            TabBarView()
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                // Back button
                ImageButton(image: AppConstants.AppImages.chevronleft) {
                    self.dismiss()
                }
                .font(.subheadline)
            }
        }
        // Show alert if there is error
        .alert("", isPresented: $vm.hasError) {
            Button(AppConstants.ButtonLabels.ok, role: .cancel) {}
        } message: {
            if let error = vm.errorMessage {
                Text(error.localizedDescription)
                    .font(.headline)
            }
        }
    }
}

struct SignUpPhoneView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUpPhoneView(vm: SignUpViewModel())
        }
    }
}
