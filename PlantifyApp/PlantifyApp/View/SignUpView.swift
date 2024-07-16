//
//  SignInView.swift
//  PlantifyApp
//
//  Created by hyk on 7/16/24.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = SignUpViewModel()
    
    @FocusState var isId: Bool
    @FocusState var isPw: Bool
    @FocusState var isName: Bool
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
                .frame(height: 50)
            
            HStack {
                Image("logo")
                
                Spacer()
            }
            .padding(.horizontal, 40)
            
            Text("회원가입을 위한\n회원정보를 입력해주세요")
                .font(.system(size: 25, weight: .bold))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.vertical, 40)
            
            InputField(content: $viewModel.model.id, prompt: "아이디를 입력해주세요", focus: _isId)
            InputField(content: $viewModel.model.pw, prompt: "비밀번호를 입력해주세요", focus: _isPw)
            InputField(content: $viewModel.model.name, prompt: "닉네임을 입력해주세요", focus: _isName)
            
            Button {
                
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 50)
                    .foregroundStyle(Color.baseGreen)
                    .overlay {
                        Text("회원가입")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.white)
                    }
            }
            .padding(.horizontal, 50)
            
            Spacer()
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .accentColor(Color.baseGreen)
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
        SignUpView()
    }
}
