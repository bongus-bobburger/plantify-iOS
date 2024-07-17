//
//  ProductCell.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import SwiftUI

struct ProductCell: View {
    let image: String
    let title: String
    let name: String
    let price: String
    
    var body: some View {
        NavigationLink(destination: MarketDetailView(image: "https://static.wixstatic.com/media/53e8bb_a1e88e551162485eb4ff962437300872~mv2.jpeg/v1/crop/x_0,y_105,w_1024,h_919/fill/w_560,h_560,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/Banana.jpeg", price: "1000", title: "바나나", content: "바나나나나")) {
            VStack {
                Divider()
                
                HStack {
                    if image != nil, let fileURL = URL(string: image) {
                            AsyncImage(url: fileURL) { image in
                                image
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 100, height: 100)
                            }
                            .frame(height: 100)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.system(size: 15, weight: .bold))
                        
                        Text(name)
                            .font(.system(size: 11))
                            .foregroundStyle(.gray)
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Spacer()
                        
                        Text("구매가")
                            .font(.system(size: 11))
                            .foregroundStyle(.gray)
                        
                        Text("\(price)원")
                            .font(.system(size: 15, weight: .bold))
                    }
                }
                .padding(.horizontal, 20)
            }
            .frame(height: 110)
            .tint(.white)
        }
    }
}

#Preview {
    NavigationView {
        ProductCell(image: "https://static.wixstatic.com/media/53e8bb_a1e88e551162485eb4ff962437300872~mv2.jpeg/v1/crop/x_0,y_105,w_1024,h_919/fill/w_560,h_560,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/Banana.jpeg", title: "바나나", name: "호날두", price: "10000")
    }
}
