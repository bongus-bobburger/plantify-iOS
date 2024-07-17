//
//  ProfileModel.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import Foundation

struct ProfileModel: Codable {
    var status: Int = 0
    var success: Bool = false
    var state: String = ""
    var message: String = ""
    var data: ProfileData = ProfileData()
}

struct ProfileData: Codable {
    var id: Int = 0
    var email: String = ""
    var name: String = ""
}
