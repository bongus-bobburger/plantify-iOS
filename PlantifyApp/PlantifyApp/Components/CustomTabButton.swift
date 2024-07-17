//
//  CustomTabButton.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import SwiftUI

struct CustomTabButton<Destination: View>: View {
    let image: String
    let title: String
    let destination: Destination
    
    init(image: String, title: String, destination: Destination) {
        self.image = image
        self.title = title
        self.destination = destination
    }
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(Color(red: 117/255, green: 117/255, blue: 117/255))
                
                Text(title)
                    .fontWeight(.bold)
                    .font(.custom("Apple SD Gothic Neo", size: 10))
                    .foregroundStyle(Color(red: 117/255, green: 117/255, blue: 117/255))
            }
        }
        
    }
}

#Preview {
    NavigationView {
        CustomTabButton(image: "house", title: "홈", destination: Text("집"))
    }
}
