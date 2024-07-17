//
//  PriceViewModel.swift
//  PlantifyApp
//
//  Created by hyk on 7/18/24.
//

import Foundation
import Alamofire
import UIKit

class PriceViewModel: ObservableObject {
    @Published var priceModel = PriceModel()
    @Published var priceImageModel = PriceImageModel()
    @Published var priceResponse = PriceResponse()
    
    func postPrice() {
        AF.request("\(Bundle.main.url)/price", method: .post, parameters: priceModel.params, encoding: JSONEncoding.default, headers: ["Authorization": "\(KeyChain.read()?.accessToken ?? "")"])
            .responseJSON { json in
                print(json)
            }
            .response { response in
                switch response.result {
                case .success(_):
                    print("성공")
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
        .responseDecodable(of: UploadResponse.self) { resonse in
            switch resonse.result {
            case .success(let data):
                self.priceModel.imagePath = data.data
                print(data.data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getPrice() {
        AF.request("\(Bundle.main.url)/price", method: .get, headers: ["Authorization": "\(KeyChain.read()?.accessToken ?? "")"])
            .responseDecodable(of: PriceResponse.self) { response in
                switch response.result {
                case .success(let data):
                    self.priceResponse = data
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
