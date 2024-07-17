//
//  PurchaseView.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import SwiftUI

struct PurchaseView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let image: String
    let title: String
    let price: String
    
    let options = [
        "신용카드",
        "무통장 입금",
        "카카오페이",
        "네이버페이",
        "토스페이"
    ]
    @State var currentSelect: String = ""
    
    var body: some View {
        VStack() {
            HStack(alignment: .top) {
                if image != nil, let fileURL = URL(string: image) {
                        AsyncImage(url: fileURL) { image in
                            image
                                .resizable()
                                .frame(width: 90, height: 60)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 90, height: 60)
                        }
                        .frame(height: 60)
                }
                
                VStack {
                    Text(title)
                        .font(.system(size: 15, weight: .bold))
                    
                    Text(price)
                        .font(.system(size: 13))
                }
                
                Spacer()
            }
            .padding(.horizontal, 25)
            
            HStack {
                Text("결제수단")
                    .font(.system(size: 15, weight: .bold))
                
                Spacer()
            }
            .padding(.horizontal, 25)
            .padding(.top, 50)
            
            ForEach(0..<options.count) { index in
                Button {
                    self.currentSelect = options[index]
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 340, height: 50)
                        .foregroundStyle(.clear)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10).stroke(self.currentSelect == self.options[index] ? Color.baseGreen : .white)
                            
                            HStack {
                                Text(options[index])
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundStyle(self.currentSelect == self.options[index] ? Color.baseGreen : .white)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                        }
                }
                .tint(.white)
            }
            
            Spacer()
            
            HStack {
                Text("상품 가격")
                    .font(.system(size: 15, weight: .bold))
                
                Spacer()
                
                Text("\(Int(price)!)원")
            }
            .padding(.horizontal, 25)
            
            HStack {
                Text("배송비")
                    .font(.system(size: 15, weight: .bold))
                
                Spacer()
                
                Text("3,000원")
            }
            .padding(.horizontal, 25)
            
            Rectangle()
                .frame(width: 340, height: 1)
            
            HStack {
                let priceInt = Int(price)!
                
                Text("상품 가격")
                Spacer()
                Text("\(priceInt+3000)원")
            }
            .padding(.horizontal, 25)
            .font(.system(size: 15, weight: .bold))
            
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 340, height: 50)
                    .foregroundStyle(Color.baseGreen)
                    .overlay {
                        Text("결제하기")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.white)
                    }
            }
            .padding(.top, 20)
        }
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
        PurchaseView(image: "https://static.wixstatic.com/media/53e8bb_a1e88e551162485eb4ff962437300872~mv2.jpeg/v1/crop/x_0,y_105,w_1024,h_919/fill/w_560,h_560,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/Banana.jpeg", title: "바나나", price: "10000")
    }
}
