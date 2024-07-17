//
//  PostCell.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import SwiftUI

struct PostCell: View {
    let name: String
    let image: String
    let title: String
    let content: String
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 30, height: 30)
                
                Text(name)
                    .font(.system(size: 15, weight: .bold))
                
                Spacer()
            }
            .padding(.horizontal, 20)
            
            if image != nil, let fileURL = URL(string: image) {
                    AsyncImage(url: fileURL) { image in
                        image
                            .resizable()
                            .frame(width: 350, height: 270)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 270)
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .font(.system(size: 15, weight: .bold))
                    
                    Text(content)
                        .font(.system(size: 13))
                    
                    Button {
                        self.isPresented.toggle()
                    } label: {
                        Text("댓글달기")
                            .font(.system(size: 13))
                            .foregroundStyle(.gray)
                    }
                    .sheet(isPresented: $isPresented) {
                        CommentsView(text: .constant(""))
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            
            Divider()
                .frame(height: 10)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    NavigationView {
        PostCell(name: "호날두", image: "https://static.wixstatic.com/media/53e8bb_a1e88e551162485eb4ff962437300872~mv2.jpeg/v1/crop/x_0,y_105,w_1024,h_919/fill/w_560,h_560,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/Banana.jpeg", title: "siu", content: "siuuuuuuuuuuuuu")
    }
}
