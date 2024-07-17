//
//  PurchaseOption.swift
//  PlantifyApp
//
//  Created by hyk on 7/17/24.
//

import SwiftUI

struct PurchaseOption: View {
    let title: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 340, height: 50)
            .foregroundStyle(.clear)
            .overlay {
                RoundedRectangle(cornerRadius: 10).stroke(Color.baseGreen)
                
                HStack {
                    Text(title)
                        .font(.system(size: 15, weight: .bold))
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
    }
}

#Preview {
    PurchaseOption(title: "신용카드")
}
