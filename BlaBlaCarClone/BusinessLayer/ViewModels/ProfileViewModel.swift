//
//  ProfileViewModel.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 23/05/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var vehicles: [String] = ["Nexon"]
    
    @Published var userData = UserResponse.userResponse
    
    /// To calculate age( in years) of user from dob
    /// - Parameter dob: String, format of date which is changed into Date format inside function
    /// - Returns: Int, age in years
    func calculateAge(dob: String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: dob) else {
            return 0
        }
        
        var years = 0
        var months = 0
        
        let cal = Calendar.current
        years = cal.component(.year, from: Date()) - cal.component(.year, from: date)
        
        let currMonth = cal.component(.month, from: Date())
        let birthMonth = cal.component(.month, from: date)
        
        // get difference between current month and birthMonth
        months = currMonth - birthMonth
        
        // if month difference is in negative then reduce years by one
        if months < 0 {
            years -= 1
            
        } else if months == 0 && cal.component(.day, from: Date()) < cal.component(.day, from: date) {
            // if month difference is 0 but present date < date of birth reduce year by 1
            years -= 1
        }
        
        return years
    }
    
    func memberSince(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let myDate = dateFormatter.date(from: date)
        
        guard let dt = myDate else {
            return "not a member yet"
        }
        
        dateFormatter.dateFormat = "MMM yyyy"
        let memberDate = dateFormatter.string(from: dt)
        return memberDate
    }
    
}
