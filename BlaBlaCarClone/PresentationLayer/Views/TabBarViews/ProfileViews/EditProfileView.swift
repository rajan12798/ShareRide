//  EditProfileView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 23/05/23.

import SwiftUI

struct EditProfileView: View {
    
    @Environment (\.dismiss) var dismiss
    
    @ObservedObject var profileVm: ProfileViewModel
    
    @State private var firstName = String()
    @State private var lastName = String()
    @State private var dob = Date()
    @State private var myDate = String()
    @State private var email = String()
    @State private var gender: String = AppConstants.AppStrings.male
    @State private var phone = String()
    @State private var bio = String()
    @State private var showPicker: Bool = false
    
    var genderType = [AppConstants.AppStrings.male, AppConstants.AppStrings.female, AppConstants.AppStrings.notSay]
    
    var body: some View {
        
        VStack {
            
            ScrollView(showsIndicators: false) {
                
                LazyVStack(alignment: .leading, spacing: 20) {
                    
                    InputFieldView(placeholder: AppConstants.AppStrings.firstName,
                                   textInputAutocapitalization: .words,
                                   textFieldValue: $firstName)
                    
                    InputFieldView(placeholder: AppConstants.AppStrings.lastName,
                                   textInputAutocapitalization: .words,
                                   textFieldValue: $lastName)
                    
                    VStack(alignment: .leading) {
                        
                        Text(AppConstants.AppStrings.gender)
                            .font(.subheadline)
                        
                        Menu {
                            ForEach(genderType, id: \.self) { gender in
                                Button {
                                    self.gender = gender
                                } label: {
                                    Text(gender)
                                }
                            }
                        } label: {
                            
                            HStack {
                                Text(gender)
                                
                                Spacer()
                                
                                Image(systemName: AppConstants.AppImages.chevronDown)
                            }
                            .foregroundColor(.black)
                            .padding(12)
                        }
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Text(AppConstants.AppStrings.dateOfBirth)
                            .font(.subheadline)
                        
                        HStack {
                            Text(myDate)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Image(systemName: AppConstants.AppImages.chevronDown)
                        }
                        .padding(14)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                        .onTapGesture {
                            showPicker.toggle()
                        }
                    }
                    
                    InputFieldView(placeholder: AppConstants.AppStrings.email,
                                   keyBoardType: .emailAddress,
                                   textFieldValue: $email)
                    
                    InputFieldView(placeholder: AppConstants.AppStrings.phoneNumber,
                                   keyBoardType: .phonePad,
                                   textFieldValue: $phone)
                    
                    InputFieldView(placeholder: AppConstants.AppStrings.bio,
                                   textFieldValue: $bio)
                }
                .padding(.bottom, 50)
            }
            
            Button {
                self.dismiss()
            } label: {
                ButtonLabelView(buttonLabel: AppConstants.ButtonLabels.save)
                    .cornerRadius(10)
            }
            .padding(.top, 10)
 
        }
        .navigationTitle(AppConstants.AppHeadings.personalDetails)
        .padding()
        .sheet(isPresented: $showPicker) {
            PickerView(showPicker: $showPicker, shownDate: $dob, myDate: $myDate)
                .presentationDetents([.height(240)])
        }
        .onAppear {
            if let data = profileVm.userData.status.data {
                firstName = data.firstName
                lastName = data.lastName
                gender = data.title
                myDate = data.dob
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EditProfileView(profileVm: ProfileViewModel())
        }
    }
}
