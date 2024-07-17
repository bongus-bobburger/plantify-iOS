//
//  ProfileViewModel.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import Foundation
import Alamofire

class ProfileViewModel: ObservableObject {
    @Published var model = ProfileModel()
    
    func getProfile() {
        AF.request("\(Bundle.main.url)/member/myInfo", method: .get, headers: ["Authorization": "\(KeyChain.read()?.accessToken ?? "")"])
            .responseDecodable(of: ProfileModel.self) { response in
                switch response.result {
                case .success(let data):
                    self.model = data
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
