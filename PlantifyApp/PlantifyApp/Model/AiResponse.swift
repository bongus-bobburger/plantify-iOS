//
//  AiResponse.swift
//  PlantifyApp
//
//  Created by hyk on 7/18/24.
//

import Foundation

struct AiResponse: Codable {
    var status: Int = 0
    var success: Bool = false
    var state: String = ""
    var message: String = ""
    var data: String = ""
}
