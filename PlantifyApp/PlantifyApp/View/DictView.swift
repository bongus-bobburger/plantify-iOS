//
//  DictView.swift
//  PlantifyApp
//
//  Created by hyk on 7/16/24.
//

import SwiftUI

struct DictView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = DictViewModel()
    
    @State var text: String = ""
    @FocusState var isClicked: Bool
    
    var body: some View {
        ScrollView {
            Image(systemName: "text.book.closed.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .foregroundStyle(Color.baseGreen)
                .padding(.bottom, 100)
            
            HStack {
                InputField(content: $text, prompt: "키워드를 입력해주세요", focus: _isClicked)
                
                Button {
                    viewModel.postKeyword(prompt: text)
                } label: {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 50, height: 30)
                        .foregroundStyle(Color.baseGreen)
                        .overlay {
                            Image(systemName: "paperplane")
                                .foregroundStyle(.white)
                        }
                }
            }
            
            if viewModel.dictResponse.data != nil {
                Text(viewModel.dictResponse.data)
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
    NavigationView {
        DictView()
    }
}
