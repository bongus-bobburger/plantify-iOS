//
//  SignInModel.swift
//  PlantifyApp
//
//  Created by hyk on 7/16/24.
//

import Foundation

struct SignInModel: Codable {
    var email: String = ""
    var password: String = ""
    
    var params: [String: Any] {
        return [
            "email": email,
            "password": password
        ]
    }
}
