//
//  PostingView.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import SwiftUI

struct PostingView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = PostingViewModel()
    
    @FocusState var isTitle: Bool
    @FocusState var isContent: Bool
    
    var body: some View {
        VStack(spacing: 50) {
            ImagePickerBox(width: 300, height: 200)
                .environmentObject(viewModel)
            
            InputField(content: $viewModel.model.title, prompt: "제목을 입력해주세요.", focus: _isTitle)
            InputField(content: $viewModel.model.description, prompt: "내용을 입력해주세요.", focus: _isContent)
            
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
                    viewModel.post()
                    self.presentationMode.wrappedValue.dismiss()
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
