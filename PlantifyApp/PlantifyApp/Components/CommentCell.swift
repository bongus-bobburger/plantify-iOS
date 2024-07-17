//
//  CommentCell.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import SwiftUI

struct CommentCell: View {
    let name: String
    let content: String
    let createdAt: String
    
    var body: some View {
        HStack {
            Image("profile")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                HStack {
                    Text(name)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text(createdAt)
                }
                
                Text(content)
            }
            .font(.system(size: 15))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}

#Preview {
    CommentCell(name: "호날두", content: "siu", createdAt: "2001-09-11")
}
