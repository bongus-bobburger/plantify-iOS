//
//  ImageViewModel.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import Foundation
import Alamofire
import UIKit

class ImageViewModel: ObservableObject {
    @Published var imageModel = ImageModel()
    @Published var aiResponse = AiResponse()
    
    func imageUpload(image: UIImage) {
        AF.upload(multipartFormData: { multipartFormData in
            if let imageData = image.jpegData(compressionQuality: 0.1) {
                multipartFormData.append(imageData, withName: "image", fileName: "image", mimeType: "image/jpeg")
            }
        }, to: "\(Bundle.main.url)/image/upload", method: .post, headers: ["Authorization": "\(KeyChain.read()?.accessToken ?? "")"])
        .responseDecodable(of: UploadResponse.self) { resonse in
            switch resonse.result {
            case .success(let data):
                self.imageModel.imageUrl = data.data
                self.sendToAi(imageUrl: self.imageModel.imageUrl)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func sendToAi(imageUrl: String) {
        let params: [String: Any] = [
            "imageUrl": imageUrl
        ]
        
        var urlComponents = URLComponents(string: "\(Bundle.main.url)/bot/chat")!
        urlComponents.queryItems = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        
        AF.request(urlComponents.url ?? "", method: .get, headers: ["Authorization": "\(KeyChain.read()?.accessToken ?? "")"])
            .responseDecodable(of: AiResponse.self) { response in
                switch response.result {
                case .success(let data):
                    self.aiResponse = data
                    print(data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
