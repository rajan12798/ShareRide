//
//  validations.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 11/05/23.
//

import Foundation

class Validations {
    
    // MARK: - Methods
    
    /// To check whether the email is valid and follows the pattern defined by the regular expression
    /// - Parameter email: String, email entered by the user
    /// - Returns: Bool, true if email is valid else false
    func isvalidEmail(_ email: String) -> Bool {
        // One or more characters followed by an "@",
        // then one or more characters followed by a ".",
        // and finishing with one or more characters
        let emailPattern = #"^\S+@\S+\.\S+$"#
        let result = email.range(
            of: emailPattern,
            options: .regularExpression
        )
        return result != nil
    }

    /// To check whether the password is valid and follows the pattern defined by the regular expression
    /// - Parameter password: String, password entered by the user
    /// - Returns: Bool, true if password is valid else false
    func isvalidPassword(_ password: String) -> Bool {
        
        let passwordPattern =
            // At least 8 characters
            #"(?=.{8,})"# +

            // At least one capital letter
            #"(?=.*[A-Z])"# +
                
            // At least one lowercase letter
            #"(?=.*[a-z])"# +
                
            // At least one digit
            #"(?=.*\d)"# +
                
            // At least one special character
            #"(?=.*[ !@/#$%&?._-])"#
        
        let result = password.range(
            of: passwordPattern,
            options: .regularExpression
        )

        return result != nil
    }
}
