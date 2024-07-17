//
//  PostingModel.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import Foundation

struct PostingModel: Codable {
    var title: String = ""
    var description: String = ""
    var imageUrl: String = ""
    
    var params: [String: Any] {
        return [
            "title": title,
            "description": description,
            "imageUrl": imageUrl
        ]
    }
}
