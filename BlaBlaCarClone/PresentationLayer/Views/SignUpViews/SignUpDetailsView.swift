//
//  SignUpDetailsView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 10/05/23.
//

import SwiftUI

struct SignUpDetailsView: View {
    @ObservedObject var vm: SignUpViewModel
    @State var isActive: Bool = true
    @Environment (\.dismiss) var dismiss
    var body: some View {
        
        VStack {

            ProgressBarView(currentValue: vm.currentValue, totalValue: vm.totalValue)
            
            Headingview(title: AppConstants.AppHeadings.whatsYourName)
            
            InputFieldView(
                placeholder: AppConstants.AppStrings.firstName,
                textInputAutocapitalization: .words,
                textFieldValue: $vm.firstName)
                .padding(.top, 20)
            
            InputFieldView(
                placeholder: AppConstants.AppStrings.lastName,
                textInputAutocapitalization: .words,
                textFieldValue: $vm.lastName)
                .padding(.top, 20)
            
            Spacer()
            
            // Next button
//            NavigationLink(destination: {
//                // Navigate to signUpDOBView to enter DOB
//                SignUpDOBView(vm: vm)
//            }, label: {
//                ButtonLabelView(buttonLabel: AppConstants.ButtonLabels.next)
//                    .cornerRadius(18)
//            })
            if isActive{
                NavigationLink(destination: {
                    // Navigate to signUpGenderView to enter gender
                    //SignUpDOBView(vm: vm)
                    DatePView(isActive: $isActive)
                }, label: {
                    ButtonLabelView(buttonLabel: AppConstants.ButtonLabels.next)
                        .cornerRadius(18)
                })
                .opacity(vm.disableNextBtn() ? 0.5 : 1)
                .disabled(vm.disableNextBtn())
            }
         
               
        }
        .onAppear {
            // Progress Bar value
            vm.currentValue = 1
        }
        .padding()
        .navigationTitle(AppConstants.AppHeadings.finishSignUp)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                // Back button
                ImageButton(image: AppConstants.AppImages.chevronleft) {
                    self.dismiss()
                }
                .font(.subheadline)
            }
        }
        
    }
}

struct SignUpDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUpDetailsView(vm: SignUpViewModel())
        }
    }
}
