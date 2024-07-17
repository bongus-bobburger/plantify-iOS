//
//  UploadResponse.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import Foundation

struct UploadResponse: Codable {
    var status: Int = 0
    var success: Bool = false
    var state: String = ""
    var message: String = ""
    var data: String = ""
}
