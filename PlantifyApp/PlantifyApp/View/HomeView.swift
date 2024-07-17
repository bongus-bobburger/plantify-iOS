//
//  HomeView.swift
//  PlantifyApp
//
//  Created by hyk on 7/16/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("호날두")
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
                    
                    ForEach(0..<10) { index in
                        PostCell(name: "호날두", image: "https://static.wixstatic.com/media/53e8bb_a1e88e551162485eb4ff962437300872~mv2.jpeg/v1/crop/x_0,y_105,w_1024,h_919/fill/w_560,h_560,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/Banana.jpeg", title: "Siu", content: "siuuuuuuuuuu")
                    }
                }
            }
            
            CustomTabBar()
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
