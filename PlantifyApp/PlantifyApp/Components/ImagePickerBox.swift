//
//  ImagePickerBox.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import SwiftUI

struct ImagePickerBox: View {
    
    let width: CGFloat
    let height: CGFloat
    
    @State private var showImagePicker = false
    @State var selectedUIImage: UIImage?
        
    var body: some View {
        VStack {
            if let image = selectedUIImage {
                ZStack {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
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
                                        Circle().stroke(.yellow, lineWidth: 1)
                                        
                                        Image(systemName: "xmark")
                                            .foregroundStyle(.yellow)
                                            .font(.system(size: 15))
                                    }
                                    .offset(x: 10, y: -10)
                            }
                        }
                        
                        Spacer()
                    }
                }
            } else {
                Button {
                    showImagePicker.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: width, height: height)
                        .foregroundColor(.clear)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10).stroke(Color.baseGreen, lineWidth: 2)
                            
                            Image(systemName: "photo.badge.plus")
                                .foregroundColor(Color.baseGreen)
                                .font(.system(size: 20))
                        }
                }
                .sheet(isPresented: $showImagePicker, onDismiss: {
                    
//                    viewModel.imageUpload(image: self.selectedUIImage ?? .init())
                }) {
                    ImagePicker(image: $selectedUIImage)
                }
            }
        }
    }
}
