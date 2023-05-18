//
//  LoginService.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 5/18/23.
//

import Foundation
import SwiftKeychainWrapper

struct ResponseData: Codable {
    var data: [String: String]
}

class LoginService {
    
    private var bearer_token: String = ""
    private var veteranDB_access_cookie: String = ""
    
    func Login(email: String, password: String) {
        
        if let bearer = (Bundle.main.infoDictionary?["BEARER_TOKEN"] as? String) {
            bearer_token = bearer
        }
        
        if let cookie = (Bundle.main.infoDictionary?["VETERANDB_ACCESS_COOKIE"] as? String) {
            veteranDB_access_cookie = cookie
        }
        
        let parameters = "{\n\t\"email\": \"\(email)\",\n\t\"password\": \"\(password)\"\n}"
        
        print("Login Service params: \(parameters)")
        
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://api.veterandb.com/v1/account/login")!,timeoutInterval: Double.infinity)
        request.addValue(bearer_token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(veteranDB_access_cookie, forHTTPHeaderField: "Cookie")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            
            print(String(data: data, encoding: .utf8)!)
        
            
            do {
                let loginResponse = try JSONDecoder().decode(ResponseData.self, from: data)
                print(loginResponse.data["access_token"] as Any)
            } catch {
                print(error)
                fatalError(error.localizedDescription)
            }
        }
        
        task.resume()


        
    }
    
}
