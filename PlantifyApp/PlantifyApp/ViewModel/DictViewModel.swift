//
//  DictViewModel.swift
//  PlantifyApp
//
//  Created by hyk on 7/18/24.
//

import Foundation
import Alamofire

class DictViewModel: ObservableObject {
    @Published var dictResponse = DictResponse()
    
    func postKeyword(prompt: String) {
        let params: [String: Any] = [
            "prompt": prompt
        ]
        
        var urlComponents = URLComponents(string: "\(Bundle.main.url)/dictionaries/gpt")!
        urlComponents.queryItems = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        
        AF.request(urlComponents.url ?? "", method: .get, headers: ["Authorization": "\(KeyChain.read()?.accessToken ?? "")"])
            .responseDecodable(of: DictResponse.self) { response in
                switch response.result {
                case .success(let data):
                    self.dictResponse = data
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
