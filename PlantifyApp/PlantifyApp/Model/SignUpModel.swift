//
//  SignUpModel.swift
//  PlantifyApp
//
//  Created by hyk on 7/16/24.
//

import Foundation

struct SignUpModel {
    var email: String = ""
    var password: String = ""
    var name: String = ""
    
    var params: [String: Any] {
        return [
            "email": email,
            "password": password,
            "name": name
        ]
    }
}
