//
//  InputField.swift
//  PlantifyApp
//
//  Created by hyk on 7/16/24.
//

import SwiftUI

struct InputField: View {
    @Binding var content: String
    let prompt: String
    @FocusState var focus: Bool
    
    var body: some View {
        VStack {
            TextField(
                text: $content,
                prompt: Text(prompt).foregroundStyle(Color.baseGray)
            ) {
            }
            .tint(Color.baseGreen)
            .focused($focus)
            .foregroundStyle(.white)
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(focus ? Color.baseGreen : Color.baseGray)
        }
        .frame(width: 300)
    }
}

#Preview {
    InputField(content: .constant(""), prompt: "아이디를 입력해주세요", focus: .init())
}
