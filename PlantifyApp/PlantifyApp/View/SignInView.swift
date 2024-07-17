//
//  SignInView.swift
//  PlantifyApp
//
//  Created by hyk on 7/16/24.
//

import SwiftUI

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()
    
    @FocusState var isId: Bool
    @FocusState var isPw: Bool
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
                .frame(height: 50)
            
            HStack {
                Image("logo")
                
                Spacer()
            }
            .padding(.horizontal, 40)
            
            Text("내맘에 꼭 드는 또 다른\n식물을 발견해보세요")
                .font(.system(size: 25, weight: .bold))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.vertical, 40)
            
            InputField(content: $viewModel.model.id, prompt: "아이디를 입력해주세요", focus: _isId)
            InputField(content: $viewModel.model.pw, prompt: "비밀번호를 입력해주세요", focus: _isPw)
            
            VStack(spacing: 10) {
                Button {
                    
                } label: {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 300, height: 50)
                        .foregroundStyle(Color.baseGreen)
                        .overlay {
                            Text("로그인")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundStyle(.white)
                        }
                }
                
                HStack {
                    Spacer()
                    
                    Text("아직 계정이 없으신가요?")
                        .foregroundStyle(Color.baseGray)
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("회원가입")
                            .foregroundStyle(Color.baseGreen)
                    }
                }
            }
            .padding(.horizontal, 50)
            
            Spacer()
        }
        .ignoresSafeArea()
        .navigationTitle("")
        .accentColor(Color.baseGreen)
    }
}

#Preview {
    NavigationView {
        SignInView()
    }
}
