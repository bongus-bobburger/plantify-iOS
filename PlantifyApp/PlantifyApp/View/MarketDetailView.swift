//
//  MarketDetailView.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import SwiftUI

struct MarketDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let image: String
    let price: String
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading) {
            if image != nil, let fileURL = URL(string: image) {
                    AsyncImage(url: fileURL) { image in
                        image
                            .resizable()
                            .frame(width: .infinity, height: 300)
                    } placeholder: {
                        ProgressView()
                            .frame(width: .infinity, height: 300)
                    }
                    .frame(height: 300)
                    .padding(.top, -40)
            }
            
            HStack {
                Text("구매가: ")
                Text("\(price)원")
                    .fontWeight(.bold)
            }
            .font(.system(size: 20))
            .padding(.horizontal, 10)
            
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .padding(.top, 30)
                .padding(.horizontal, 10)
            
            Text(content)
                .font(.system(size: 15))
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
            
            Spacer()
            
            NavigationLink(destination: PurchaseView(image: image, title: title, price: price)) {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(Color.baseGreen)
                    .frame(width: .infinity, height: 60)
                    .padding(.horizontal)
                    .overlay {
                        Text("구매하기")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .bold))
                    }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.baseGreen)
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text(title)
                    .font(.system(size: 18, weight: .bold))
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationView {
        MarketDetailView(image: "https://static.wixstatic.com/media/53e8bb_a1e88e551162485eb4ff962437300872~mv2.jpeg/v1/crop/x_0,y_105,w_1024,h_919/fill/w_560,h_560,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/Banana.jpeg", price: "10000", title: "바나나", content: "바나나나나나나나나나나나나나나나나나나나나나나나나나나나나나나나나나나나나나나나")
    }
}
