//
//  ServiceHelper.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 12/05/23.
//

import Foundation

class ServiceHelper {
    
    static let shared = ServiceHelper()
    private init() {}
    
    func session(url: URL, method: RequestMethods, body: Data?, value: String?, headerField: String) {
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue(value, forHTTPHeaderField: headerField)
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            
            guard error == nil else {
                print("Error: error calling Api")
                print(response as Any)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Error: response error")
                print(response as Any)
                return
            }
            print(response)
            
            guard (200..<299) ~= response.statusCode else {
                print("Error: statusCode != 200")
                print(response)
                return
            }
            
            guard let data = data else {
                print("Error: Did not recieve data")
                return
            }
            print(data)
            
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Error: error creating dictionary from json data")
                    return
                }
                print(jsonObject)
            } catch {
                print("Error: error creating dictionary from json data")
                return
            }
        }.resume()
    }
}
