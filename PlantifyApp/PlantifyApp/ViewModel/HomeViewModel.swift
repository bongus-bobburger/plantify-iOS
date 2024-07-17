//
//  HomeViewModel.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import Foundation
import Alamofire

class HomeViewModel: ObservableObject {
    @Published var model = HomeModel()
    
    func getPost() {
        AF.request("\(Bundle.main.url)/community", method: .get, headers: ["Authorization": "\(KeyChain.read()?.accessToken ?? "")"])
            .responseJSON { json in
                print(json)
            }
            .responseDecodable(of: HomeModel.self) { response in
                switch response.result {
                case .success(let data):
                    self.model = data
                    print(data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
