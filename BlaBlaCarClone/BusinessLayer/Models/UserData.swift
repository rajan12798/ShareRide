//
//  UserData.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 12/05/23.
//

import Foundation

struct UserData: Codable {
    
    var user: UserDetails
}

struct UserDetails: Codable {
    
    var email: String
    var password: String?
    var firstName: String?
    var lastName: String?
    var dob: String?
    var title: String?
    var phoneNumber: Int?
    
    enum CodingKeys: String, CodingKey {
        case email
        case password
        case firstName = "first_name"
        case lastName = "last_name"
        case dob
        case title
        case phoneNumber = "phone_number"
    }
}
