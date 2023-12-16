//
//  LoginViewModel.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 12/05/23.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var email = String()
    @Published var password = String()
    
    @Published var logInActive: Bool = false
    @Published var errorMessage: APIError?
    @Published var userResponse = UserResponse.userResponse
    
    let network = NetworkManager.shared
    var publisher: AnyCancellable?
    
    func disableButton() -> Bool {
        if !email.isEmpty && !password.isEmpty {
            return false
        }
        return true
    }
    
    func logIn() {
        publisher = network.signUpLogIn(
            type: AppConstants.ButtonLabels.logIn,
            data: UserData(user: UserDetails(email: email, password: password)))
        .receive(on: DispatchQueue.main)
        .sink { completion in
            switch completion {
            case .failure(let error):
                print(error)
                self.errorMessage = error as? APIError
                self.logInActive = false
                
            case .finished:
                print("successful")
                self.logInActive = true
            }
        } receiveValue: { [weak self] data in
            self?.userResponse = data
        }
    }
}
