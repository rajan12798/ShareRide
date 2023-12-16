//
//  ContentView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 10/05/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @StateObject var vm = OnboardingViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                VStack {
                    Image(AppConstants.AppImages.carpool)
                        .ignoresSafeArea()
                }
                .frame(maxHeight: 400)
                
                VStack {
                    Text(AppConstants.AppHeadings.welcomeMssg)
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .bold()
                    Text(AppConstants.AppHeadings.yourRideChoice)
                        .foregroundColor(.black)
                        .font(.title3)
                }
                
                Spacer()
                
                VStack {
                    Text(AppConstants.AppHeadings.getStarted)
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    // SignUp Button
                    NavigationLink(destination: {
                        // Navigate to SignUpView
                        SignUpView(onboardVm: vm)
                       
                    }, label: {
                        ButtonLabelView(buttonLabel: AppConstants.ButtonLabels.signUp)
                            .cornerRadius(18)
                    })
                    .simultaneousGesture(TapGesture().onEnded({
                        // used in SignUp view and loginView to tell that we came from onboardView
                        vm.fromSignUpView = true
                    }))
                    
                    // LogIn Button
                    NavigationLink {
                        // Navigate to Login View
                        LoginView(onboardVm: vm)
                    } label: {
                        Text(AppConstants.ButtonLabels.logIn)
                            .font(.headline)
                            .padding(.vertical, 12)
                            .foregroundColor(Color.accentColor)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.accentColor, lineWidth: 1.2)
                            )
                    }
                    .simultaneousGesture(TapGesture().onEnded({
                        // used in loginView to tell that we came from onboardView, not SignUp View
                        vm.fromSignUpView = false
                    }))
                }
                .padding()
                
                Spacer()
            }
            .background(.white)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
