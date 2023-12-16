//
//  SignUpViewModel.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 10/05/23.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject,Identifiable{
    
    // MARK: - Properties
    
    @Published var email = String()
    @Published var password = String()
    @Published var confirmPassword = String()
    @Published var firstName = String()
    @Published var lastName = String()
    @Published var dateOfBirth = Date.now
    @Published var gender = String()
    @Published var phoneNumber = String()
    
    @Published var currentValue: Float = 1
    @Published var totalValue: Float = 4
    
    @Published var phoneMessage = String()
    @Published var errorMessage: APIError?
    @Published var userResponse: UserResponse?
    
    @Published var emailPrompt: Bool = false
    @Published var passPrompt: Bool = false
    @Published var confirmPrompt: Bool = false
    @Published var phonePrompt: Bool = false
    
    @Published var signUpActive: Bool = false
    @Published var newUser: Bool = true
    @Published var hasError: Bool = false
    @Published var isLoading: Bool = false
    
    var publisher: AnyCancellable?
    var validation = Validations()
    var genderType = [AppConstants.AppStrings.male, AppConstants.AppStrings.female, AppConstants.AppStrings.notSay]
    let network = NetworkManager.shared
    
    // MARK: - Methods
    
    /// used to check if email is already in user or not
    func checkEmail() {
        
        isLoading = true
        
        publisher = network.checkEmail(email: self.email)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                    
                case .failure(let error):
                    print(error)
                    self.isLoading = false
                    self.hasError = true
                    self.errorMessage = error as? APIError
                    
                case .finished:
                    self.isLoading = false
                    print("successful")
                    self.newUser.toggle()
                }
            }, receiveValue: { [weak self] data in
                self?.userResponse = data
            })
    }
    
    /// sign up user
    func signUp() {
        
        isLoading = true
        
        publisher = network.signUpLogIn(type: AppConstants.ButtonLabels.signUp, data: makeCredentials())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                    self.isLoading = false
                    self.hasError = true
                    self.errorMessage = error as? APIError
                    
                case .finished:
                    print("successful")
                    self.isLoading = false
                    self.signUpActive.toggle()
                }
            } receiveValue: { [weak self] data in
                self?.userResponse = data
            }
    }
    
    func makeCredentials() -> UserData {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let dob = dateFormatter.string(from: dateOfBirth)
        
        let userDetails = UserDetails(
            email: email,
            password: password,
            firstName: firstName,
            lastName: lastName,
            dob: dob,
            title: gender,
            phoneNumber: Int(phoneNumber)
        )
        
        return UserData(user: userDetails)
    }
    
    /// To check if mail is valid and on that basis show message to user
    func validEmail() {
        if !validation.isvalidEmail(email) {
            emailPrompt = true
        } else {
            emailPrompt = false
        }
    }
    
    /// To check if password is valid and on that basis show message to user
    func validPassword() {
        if !validation.isvalidPassword(password) {
            passPrompt = true
        } else {
            passPrompt = false
        }
    }
    
    /// To check if confirmPassword matches with password and on that basis show message to user
    func confirmPass() {
        if confirmPassword != password {
            confirmPrompt = true
        } else {
            confirmPrompt = false
        }
    }
    
    /// To check if phone number is valid or not
    func validPhone() {
        
        if Int(phoneNumber) == nil {
            phonePrompt = true
            phoneMessage = AppConstants.AppStrings.phoneInt
        } else if phoneNumber.count != 10 {
            phonePrompt = true
            phoneMessage = AppConstants.AppStrings.phonePrompt
        } else {
            phonePrompt = false
        }
    }
    
    /// if email, password, confirmPassword are not valid, disable the button
    /// - Returns: Bool, if valid returns false, else true

    func disableButton() -> Bool {
        if !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty {
            if !emailPrompt && !passPrompt && !confirmPrompt {
                return false
            }
        }
        return true
    }
    
    ///  To check whether to disable Next button or not
    /// - Returns: Bool
    func disableNextBtn() -> Bool {
        if !firstName.isEmpty && !lastName.isEmpty {
            return false
        }
        return true
    }
    
    func disableSignUpbtn() -> Bool {
        if !phoneNumber.isEmpty && !phonePrompt {
            return false
        }
        return true
    }
}
