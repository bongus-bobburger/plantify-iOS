//
//  CommentsView.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import SwiftUI

struct CommentsView: View {
    @Binding var text: String
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 40, height: 6)
                .foregroundStyle(.gray)
                .padding(.top)
            
            Text("댓글")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
            
            ScrollView {
                CommentCell(name: "호날두", content: "siu", createdAt: "2001-09-11")
                CommentCell(name: "호날두", content: "siu", createdAt: "2001-09-11")
                CommentCell(name: "호날두", content: "siu", createdAt: "2001-09-11")
                CommentCell(name: "호날두", content: "siu", createdAt: "2001-09-11")
                CommentCell(name: "호날두", content: "siu", createdAt: "2001-09-11")
                CommentCell(name: "호날두", content: "siu", createdAt: "2001-09-11")
            }
            
            HStack {
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 320, height: 40)
                    .foregroundStyle(.clear)
                    .overlay {
                        RoundedRectangle(cornerRadius: 30).stroke(Color.baseGreen)
                        
                        HStack {
                            Spacer()
                                .frame(width: 10)
                            
                            TextField(text: $text, prompt: Text("댓글 달기")) {
                                
                            }
                            .frame(width: 240)
                            .tint(Color.baseGreen)
                            
                            Button {
                                
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
                    }
                
            }
        }
    }
}

#Preview {
    NavigationView {
        CommentsView(text: .constant(""))
    }
}
