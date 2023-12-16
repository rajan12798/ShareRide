//
//  NetworkManager.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 12/05/23.
//

import Foundation
import Combine

class NetworkManager {
    
    static let shared = NetworkManager()
    var serviceHelper = ServiceHelper.shared
    
    private init() {}
    
    /// To verify if email already exists during signUp process
    /// - Parameter email: String, emil address enteres by user
    /// - Returns: If success, returns userResponse? ( no response at success ), if failure returns Error
    func checkEmail(email: String) -> AnyPublisher<UserResponse?, Error> {
        
        let url = AppConstants.ApiKeys.baseUrl + AppConstants.ApiKeys.checkEmailEndPoint + email
        
        guard let url = URL(string: url) else {
            print("error creating url")
            return Fail(error: APIError.badURL)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
        // handle URL errors (most likely not able to connect to the server)
            .mapError { error -> Error in
                return APIError.serverError(error)
            }
        // handle all other errors
            .tryMap { (data, response) in
                print("Recieved response from server, now checking status code")
                
                guard let urlResponse = response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                
                switch urlResponse.statusCode {
                case 200..<300:
                    print("Ok")
                case 422:
                    let jsonObject = try JSONDecoder().decode(UserResponse.self, from: data)
                    throw APIError.validationError(jsonObject.status.error!)
                default:
                    throw APIError.invalidResponse
                }
               return nil
            }
            .eraseToAnyPublisher()
    }
    
    func signUpLogIn(type: String, data: UserData) -> AnyPublisher<UserResponse, Error> {
        
        var url = AppConstants.ApiKeys.baseUrl
        
        if type == AppConstants.ButtonLabels.signUp {
            url += AppConstants.ApiKeys.signUpEndPoint
        } else if type == AppConstants.ButtonLabels.logIn {
            url += AppConstants.ApiKeys.logInEndPoint
        }
        
        guard let url = URL(string: url) else {
            print("error creating URL")
            return Fail(error: APIError.badURL)
                .eraseToAnyPublisher()
        }
        
        guard let jsonData = try? JSONEncoder().encode(data) else {
            print("error trying to convert model to jsonData")
            return Fail(error: APIError.parsing)
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = RequestMethods.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        return URLSession.shared.dataTaskPublisher(for: request)
        // handle URL errors (most likely not able to connect to the server)
            .mapError { error -> Error in
                return APIError.serverError(error)
            }
        // handle all other errors
            .tryMap { (data, response) -> (data: Data, response: URLResponse) in
                print("Recieved response from server, now checking status code")
                
                guard let urlResponse = response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                
                if !((200..<300) ~= urlResponse.statusCode) {
                    throw APIError.badResponse(urlResponse.statusCode)
                }

                return (data, urlResponse)
            }
        
            .map(\.data)
            .tryMap { data in
                let decoder = JSONDecoder()
                do {
                    let jsonObject = try decoder.decode(UserResponse.self, from: data)
                    print(jsonObject)
                    return jsonObject
                } catch {
                    throw APIError.parsing
                }
            }
            .eraseToAnyPublisher()
    }
    
}
