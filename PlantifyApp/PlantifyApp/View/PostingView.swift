//
//  PostingView.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import SwiftUI

struct PostingView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @FocusState var isTitle: Bool
    @FocusState var isContent: Bool
    
    var body: some View {
        VStack(spacing: 50) {
            Spacer()
                .frame(height: 20)
            
            ImagePickerBox(width:300, height: 200)
            
            InputField(content: .constant(""), prompt: "제목을 입력해주세요.", focus: _isTitle)
            InputField(content: .constant(""), prompt: "내용을 입력해주세요.", focus: _isContent)
            
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
                    
                } label: {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 50, height: 30)
                        .foregroundStyle(Color.baseGreen)
                        .overlay {
                            Text("게시")
                                .foregroundStyle(.white)
                                .font(.system(size: 15, weight: .bold))
                        }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        PostingView()
    }
}
