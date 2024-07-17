//
//  MyPlantCell.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import SwiftUI

struct MyPlantCell: View {
    let image: String
    let name: String
    
    var body: some View {
        VStack(alignment: .leading) {
            if image != nil, let fileURL = URL(string: image) {
                    AsyncImage(url: fileURL) { image in
                        image
                            .resizable()
                            .frame(width: 150, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 100)
            }
            
            Text(name)
                .font(.system(size: 15, weight: .bold))
        }
        .tint(Color.baseGreen)
    }
}

#Preview {
    MyPlantCell(image: "https://static.wixstatic.com/media/53e8bb_a1e88e551162485eb4ff962437300872~mv2.jpeg/v1/crop/x_0,y_105,w_1024,h_919/fill/w_560,h_560,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/Banana.jpeg", name: "바나나")
}
