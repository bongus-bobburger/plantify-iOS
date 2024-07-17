//
//  PostingViewModel.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import Foundation
import Alamofire
import UIKit

class PostingViewModel: ObservableObject {
    @Published var model = PostingModel()
    
    func post() {
        AF.request("\(Bundle.main.url)/community", method: .post, parameters: model.params, encoding: JSONEncoding.default, headers: ["Authorization": "\(KeyChain.read()?.accessToken ?? "")"])
            .response { response in
                switch response.result {
                case .success(_):
                    self.model.imageUrl = ""
                    self.model.title = ""
                    self.model.description = ""
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func imageUpload(image: UIImage) {
        AF.upload(multipartFormData: { multipartFormData in
            if let imageData = image.jpegData(compressionQuality: 0.1) {
                multipartFormData.append(imageData, withName: "image", fileName: "image", mimeType: "image/jpeg")
            }
        }, to: "\(Bundle.main.url)/image/upload", method: .post, headers: ["Authorization": "\(KeyChain.read()?.accessToken ?? "")"])
        .responseJSON { json in
            print(json)
        }
        .responseDecodable(of: UploadResponse.self) { resonse in
            switch resonse.result {
            case .success(let data):
                self.model.imageUrl = data.data
                print(data.data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
