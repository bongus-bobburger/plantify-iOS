//
//  PostCell.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import SwiftUI

struct PostCell: View {
    let viewModel: HomeViewModel
    
    let index: Int
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 30, height: 30)
                
                Text(viewModel.model.data[index].userName)
                    .font(.system(size: 15, weight: .bold))
                
                Spacer()
            }
            .padding(.horizontal, 20)
            
            if viewModel.model.data[index].imageUrl != nil, let fileURL = URL(string: viewModel.model.data[index].imageUrl) {
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
                    Text(viewModel.model.data[index].title)
                        .font(.system(size: 15, weight: .bold))
                    
                    Text(viewModel.model.data[index].description)
                        .font(.system(size: 13))
                    
//                    Button {
//                        self.isPresented.toggle()
//                    } label: {
//                        Text("댓글달기")
//                            .font(.system(size: 13))
//                            .foregroundStyle(.gray)
//                    }
//                    .sheet(isPresented: $isPresented) {
//                        CommentsView(text: .constant(""))
//                    }
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
