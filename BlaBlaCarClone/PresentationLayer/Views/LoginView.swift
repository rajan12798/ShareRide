//
//  LoginPage.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 12/05/23.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var onboardVm: OnboardingViewModel
    @StateObject var vm = LoginViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        
        VStack {
            
            InputFieldView(placeholder: AppConstants.AppStrings.email,
                           keyBoardType: .emailAddress,
                           textFieldValue: $vm.email)
                .padding(.top, 20)
            
            // Password
            InputFieldView(placeholder: AppConstants.AppStrings.password,
                           textFieldValue: $vm.password)
                .padding(.top, 20)
            
            Spacer()
            
            // Login button
            NavigationLink(destination: TabBarView(),
                           isActive: $vm.logInActive,
                           label: {  ButtonLabelView(buttonLabel: AppConstants.ButtonLabels.logIn)
                .cornerRadius(18)})
            .simultaneousGesture(TapGesture().onEnded({
                vm.logIn()
            }))
            .opacity(vm.disableButton() ? 0.5 : 1)
            .disabled(vm.disableButton())
            
            // SignUpButton
            HStack {
                Spacer()
                Text(AppConstants.AppStrings.notMember)
                
                // If coming from SignUp View
                if onboardVm.fromSignUpView {
                    Button {
                        // Pop to SignUp View
                        self.mode.wrappedValue.dismiss()
                    } label: {
                        Text(AppConstants.ButtonLabels.signUp)
                            .foregroundColor(Color.accentColor)
                    }
                }
                // If Coming from onboarding view
                else {
                    NavigationLink(destination: {
                        // Navigate to signUp view
                        SignUpView(onboardVm: onboardVm)
                    }, label: {
                        Text(AppConstants.ButtonLabels.signUp)
                            .foregroundColor(Color.accentColor)
                    })
                }
                
                Spacer()
            }
            .padding(.top, 20)
            .font(.headline)
                
        }
        .padding()
        .navigationTitle(AppConstants.AppStrings.login)
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                // Back button
                ImageButton(image: AppConstants.AppImages.chevronleft) {
                    self.mode.wrappedValue.dismiss()
                }
                .font(.subheadline)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LoginView(onboardVm: OnboardingViewModel())
        }
    }
}
