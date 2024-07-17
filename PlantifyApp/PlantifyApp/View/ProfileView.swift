//
//  ProfileView.swift
//  PlantifyApp
//
//  Created by hyk on 7/16/24.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(width: .infinity, height: 300)
                    .foregroundStyle(LinearGradient(colors: [.gray, .black], startPoint: .top, endPoint: .bottom))
                
                Spacer()
            }
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                    .frame(height: 50)
                
                HStack(alignment: .top) {
                    Image("profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("호날두")
                                .foregroundStyle(Color.baseGreen)
                            
                            Text("님 반가워요!")
                        }
                        .font(.system(size: 25, weight: .black))
                        
                        Text("ronaldo")
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    Text("나의 식물")
                        .font(.system(size: 20, weight: .bold))
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.top, 50)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Spacer()
                            .frame(width: 30)
                        
                        ForEach(0..<10) { index in
                            MyPlantCell(image: "https://static.wixstatic.com/media/53e8bb_a1e88e551162485eb4ff962437300872~mv2.jpeg/v1/crop/x_0,y_105,w_1024,h_919/fill/w_560,h_560,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/Banana.jpeg", name: " 바나나")
                        }
                    }
                }
                
                Spacer()
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.baseGreen)
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        ProfileView()
    }
}
