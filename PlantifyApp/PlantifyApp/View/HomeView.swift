//
//  HomeView.swift
//  PlantifyApp
//
//  Created by hyk on 7/16/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var profileViewModel = ProfileViewModel()
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text(profileViewModel.model.data.name)
                        .foregroundStyle(Color.baseGreen)
                    
                    Text("님 반가워요!")
                    
                    Spacer()
                    
                    NavigationLink(destination: PostingView()) {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundStyle(Color.baseGreen)
                    }
                }
                .font(.system(size: 25, weight: .black))
                .padding(.horizontal, 20)
                
                ScrollView {
                    ForEach(0..<homeViewModel.model.data.count, id: \.self) { index in
                        PostCell(viewModel: self.homeViewModel, index: index)
                    }
                    
                    Spacer()
                        .frame(height: 50)
                }
            }
            
            CustomTabBar()
        }
        .onAppear {
            profileViewModel.getProfile()
            homeViewModel.getPost()
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
