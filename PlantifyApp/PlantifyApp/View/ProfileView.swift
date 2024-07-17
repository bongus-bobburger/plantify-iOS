//
//  ProfileView.swift
//  PlantifyApp
//
//  Created by hyk on 7/16/24.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = ProfileViewModel()
    @StateObject var priceViewModel = PriceViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(width: .infinity, height: 300)
                    .foregroundStyle(LinearGradient(colors: [.gray, .black], startPoint: .top, endPoint: .bottom))
                
                Spacer()
            }
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                    .frame(height: 50)
                
                HStack(alignment: .top) {
                    Image("profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(viewModel.model.data.name)
                                .foregroundStyle(Color.baseGreen)
                            
                            Text("님 반가워요!")
                        }
                        .font(.system(size: 25, weight: .black))
                        
                        Text(viewModel.model.data.email)
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    Text("나의 식물")
                        .font(.system(size: 20, weight: .bold))
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.top, 50)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Spacer()
                            .frame(width: 30)
                        
                        ForEach(0..<priceViewModel.priceResponse.data.count, id: \.self) { index in
                            MyPlantCell(image: priceViewModel.priceResponse.data[index].imageUrl, name: priceViewModel.priceResponse.data[index].name)
                        }
                    }
                }
                
                Spacer()
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
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    if KeyChain.delete() {exit()}
                } label: {
                    Text("로그아웃")
                        .foregroundStyle(.red)
                }
            }
        }
        .onAppear {
            viewModel.getProfile()
            priceViewModel.getPrice()
        }
    }
}

#Preview {
    NavigationView {
        ProfileView()
    }
}
