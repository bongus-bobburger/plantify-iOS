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
    
    @StateObject var viewModel = PriceViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(0..<viewModel.priceResponse.data.count, id: \.self) { index in
                ProductCell(image: viewModel.priceResponse.data[index].imageUrl, title: viewModel.priceResponse.data[index].name, name: "이승혁", price: viewModel.priceResponse.data[index].price, description: viewModel.priceResponse.data[index].description)
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
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: MarketPostingView()) {
                    Image(systemName: "plus")
                        .foregroundStyle(Color.baseGreen)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            viewModel.getPrice()
        }
    }
}

#Preview {
    NavigationView {
        MarketView()
    }
}
