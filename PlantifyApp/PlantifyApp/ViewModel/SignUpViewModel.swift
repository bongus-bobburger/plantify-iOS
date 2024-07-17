//
//  SignUpViewModel.swift
//  PlantifyApp
//
//  Created by hyk on 7/16/24.
//

import Foundation
import Alamofire

class SignUpViewModel: ObservableObject {
    @Published var model = SignUpModel()
    
    func signUp() {
        AF.request("\(Bundle.main.url)/member/register", method: .post, parameters: model.params, encoding: JSONEncoding.default)
            .responseJSON { json in
                print(json)
            }
    }
}
