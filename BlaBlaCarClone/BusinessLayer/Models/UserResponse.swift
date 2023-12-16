//
//  UserResponse.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 22/05/23.
//

import Foundation

struct UserResponse: Codable {
    var status: Status
}

struct Status: Codable {
    var code: Int
    var message: String?
    var error: String?
    var data: Dataresponse?
    var imageUrl: URL?
    
    enum CodingKeys: String, CodingKey {
        case code
        case message
        case error
        case data
        case imageUrl = "image_url"
    }
}

struct Dataresponse: Codable {
    var id: Int
    var email: String
    var createdAt: String
    var firstName: String
    var lastName: String
    var dob: String
    var title: String
    var phoneNumber: String
    var bio: String?
    var travelPreferences: String?
    var postalAddress: String?
    var activated: Bool?
    var sessionKey: String?
    var averageRating: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case createdAt = "created_at"
        case firstName = "first_name"
        case lastName = "last_name"
        case dob
        case title
        case phoneNumber = "phone_number"
        case bio
        case travelPreferences = "travel_preferences"
        case postalAddress = "postal_address"
        case activated
        case sessionKey = "session_key"
        case averageRating = "average_rating"
    }
}

extension UserResponse {
    static let userResponse = UserResponse(
        status: Status(code: 0, data: Dataresponse(id: 0,
                                                   email: "simran24@gmail.com",
                                                   createdAt: "2023-05-22T09:46:19.918Z",
                                                   firstName: "Simran",
                                                   lastName: "Garg",
                                                   dob: "2001-08-24",
                                                   title: "mr",
                                                   phoneNumber: "7889219897",
                                                   bio: "adventure seeker",
                                                   postalAddress: "mohali",
                                                   activated: true,
                                                   averageRating: 4.0)))
}
