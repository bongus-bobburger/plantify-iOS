//
//  CustomTabBar.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .foregroundStyle(.black)
                .shadow(radius: 3, y: -2)
                
                HStack {
                    Spacer()
                    
                    CustomTabButton(image: "camera.macro", title: "식물찾기", destination: ImageView())
                    
                    Spacer()
                    
                    CustomTabButton(image: "dollarsign", title: "구매하기", destination: MarketView())
                    
                    Spacer()
                    
                    CustomTabButton(image: "text.book.closed", title: "백과사전", destination: DictView())
                    
                    Spacer()
                    
                    CustomTabButton(image: "person", title: "프로필", destination: ProfileView())
                   
                    Spacer()
                }
                .padding(.bottom)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        CustomTabBar()
    }
}
