//
//  PriceResponse.swift
//  PlantifyApp
//
//  Created by hyk on 7/18/24.
//

import Foundation

struct PriceResponse: Codable {
    var status: Int = 0
    var success: Bool = false
    var state: String = ""
    var message: String = ""
    var data: [PriceData] = []
}

struct PriceData: Codable {
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    var price: String = ""
    var imageUrl: String = ""
}
