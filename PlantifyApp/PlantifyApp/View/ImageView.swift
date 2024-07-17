//
//  ImageView.swift
//  PlantifyApp
//
//  Created by hyk on 7/16/24.
//

import SwiftUI

struct ImageView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = ImageViewModel()
    @State private var showImagePicker = false
    @State var selectedUIImage: UIImage?
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 100)
            
            Text("궁금한 식물의 사진을 업로드해주세요.")
                .font(.system(size: 15, weight: .bold))
            
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
            
            if viewModel.aiResponse.data != nil {
                Text(viewModel.aiResponse.data)
                    .padding(.horizontal, 20)
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
        }
    }
}

#Preview {
    ImageView()
}
