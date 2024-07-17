//
//  StatusModel.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import Foundation

import Foundation

struct StatusModel<Model: Decodable>: Decodable {
    let status: Int
    let message: String
    let data: Model?
    
    
    init(status: Int, message: String, data: Model? = nil) {
        self.status = status
        self.message = message
        self.data = data
    }
}
