//
//  SignUpGenderView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 10/05/23.
//

import SwiftUI

struct SignUpGenderView: View {
    
    @ObservedObject var vm: SignUpViewModel
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        VStack {
            
            ProgressBarView(currentValue: vm.currentValue, totalValue: vm.totalValue)
            
            Headingview(title: AppConstants.AppHeadings.whatsYourgender)
            
            Picker(AppConstants.AppStrings.gender, selection: $vm.gender) {
                
                ForEach(vm.genderType, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.wheel)
            
            Spacer()
            
            // Next Button
            NavigationLink(destination: {
                // Navigate to SignUpPhoneView to enter phone number
                SignUpPhoneView(vm: vm)
            }, label: {
                ButtonLabelView(buttonLabel: AppConstants.ButtonLabels.next)
                    .cornerRadius(18)
            })
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
        .onAppear {
            // progress bar value
            vm.currentValue = 3
        }
    }
}

struct SignUpGenderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUpGenderView(vm: SignUpViewModel())
        }
    }
}
