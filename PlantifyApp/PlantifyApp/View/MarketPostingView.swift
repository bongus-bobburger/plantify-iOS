//
//  MarketPostingView.swift
//  PlantifyApp
//
//  Created by hyk on 7/18/24.
//

import SwiftUI

struct MarketPostingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @FocusState var isName: Bool
    @FocusState var isDes: Bool
    @FocusState var isPrice: Bool
    
    @State private var showImagePicker = false
    @State var selectedUIImage: UIImage?
    
    @StateObject var viewModel = PriceViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
                .frame(height: 10)
            
            if let image = selectedUIImage {
                ZStack {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: 300, height: 200)
                    
                    VStack {
                        HStack {
                            Spacer()
                            
                            Button {
                                self.selectedUIImage = nil
                            } label: {
                                Circle()
                                    .frame(width: 25, height: 25)
                                    .foregroundStyle(.white)
                                    .overlay {
                                        Circle().stroke(Color.baseGreen, lineWidth: 1)
                                        
                                        Image(systemName: "xmark")
                                            .foregroundStyle(Color.baseGreen)
                                            .font(.system(size: 15))
                                    }
                            }
                            .offset(x: 5,y: -5)
                        }
                        
                        Spacer()
                    }
                    .frame(width: 300, height: 200)
                }
            } else {
                Button {
                    showImagePicker.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 200)
                        .foregroundColor(.clear)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10).stroke(Color.baseGreen, lineWidth: 2)
                            
                            Image(systemName: "photo.badge.plus")
                                .foregroundColor(Color.baseGreen)
                                .font(.system(size: 20))
                        }
                }
                .sheet(isPresented: $showImagePicker, onDismiss: {
                    viewModel.imageUpload(image: self.selectedUIImage ?? .init())
                }) {
                    ImagePicker(image: $selectedUIImage)
                }
            }
            
            InputField(content: $viewModel.priceModel.name, prompt: "상품 이름을 입력해주세요.", focus: _isName)
            
            InputField(content: $viewModel.priceModel.description, prompt: "상품 설명을 입력해주세요.", focus: _isDes)
            
            InputField(content: $viewModel.priceModel.price, prompt: "가격을 입력해주세요.", focus: _isPrice)
            
            Spacer()
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
                    viewModel.postPrice()
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 50, height: 30)
                        .foregroundStyle(Color.baseGreen)
                        .overlay {
                            Text("게시")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.white)
                        }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        MarketPostingView()
    }
}
