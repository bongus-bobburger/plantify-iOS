//
//  SignInViewModel.swift
//  PlantifyApp
//
//  Created by hyk on 7/16/24.
//

import Foundation
import SwiftUI
import Alamofire

class SignInViewModel: ObservableObject {
    @Published var model = SignInModel()
    
    func signin() {
        guard let viewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        let nextVC = UIHostingController(rootView: NavigationView { HomeView() })
        nextVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        if (self.model.email != "") && (self.model.password != "") {
            AF.request("\(Bundle.main.url)/member/login",
                       method: .post,
                       parameters: self.model.params,
                       encoding: JSONEncoding()
                       
            )
            .validate()
            .responseDecodable(of: StatusModel<TokenModel>.self) { response in
                
                switch response.result {
                case .success(let result):
                    
                    if let data = result.data {
                        if KeyChain.create(token: data) {
                            viewController.present(nextVC, animated: true)
                        }
                        else {
                            
                        }
                    }
                   
                    
                case .failure(_):
                    break
                }
            }
        }
        
    }
}
