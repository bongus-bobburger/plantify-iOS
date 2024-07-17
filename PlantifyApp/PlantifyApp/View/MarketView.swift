//
//  MarketView.swift
//  PlantifyApp
//
//  Created by hyk on 7/16/24.
//

import SwiftUI

struct MarketView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var text: String = ""
    
    var body: some View {
        ScrollView {
            ForEach(0..<10) { index in
                ProductCell(image: "https://static.wixstatic.com/media/53e8bb_a1e88e551162485eb4ff962437300872~mv2.jpeg/v1/crop/x_0,y_105,w_1024,h_919/fill/w_560,h_560,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/Banana.jpeg", title: "바나나", name: "호날두", price: "10000")
            }
        }
        .tint(Color.baseGreen)
        .navigationTitle("구매하기")
        .navigationBarTitleDisplayMode(.large)
        .searchable(text: $text, prompt: Text("찾아보기"))
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.baseGreen)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationView {
        MarketView()
    }
}
