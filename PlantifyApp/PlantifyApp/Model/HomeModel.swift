//
//  HomeModel.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import Foundation

struct HomeModel: Codable {
    var status: Int = 0
    var success: Bool = false
    var state: String = ""
    var message: String = ""
    var data: [Datum] = []
}

struct Datum: Codable {
    var id: Int = 0
    var title: String = ""
    var description: String = ""
    var imageUrl: String = ""
    var userName: String = ""
}
