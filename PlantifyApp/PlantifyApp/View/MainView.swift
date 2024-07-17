//
//  MainView.swift
//  PlantifyApp
//
//  Created by hyk on 7/16/24.
//

import SwiftUI

struct MainView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }
            
            ImageView()
                .tabItem {
                    Image(systemName: "camera.macro")
                    Text("식물찾기")
                }
            
            MarketView()
                .tabItem {
                    Image(systemName: "dollarsign")
                    Text("구매하기")
                }
            
            DictView()
                .tabItem {
                    Image(systemName: "book.pages")
                    Text("백과사전")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("프로필")
                }
        }
        .tint(Color.baseGreen)
    }
}

#Preview {
    MainView()
}
