//
//  PriceModel.swift
//  PlantifyApp
//
//  Created by hyk on 7/18/24.
//

import Foundation

struct PriceModel: Codable {
    var name: String = ""
    var description: String = ""
    var price: String = ""
    var imagePath: String = ""
    
    var params: [String: Any] {
        return [
            "name": name,
            "description": description,
            "price": price,
            "imagePath": imagePath
        ]
    }
}
