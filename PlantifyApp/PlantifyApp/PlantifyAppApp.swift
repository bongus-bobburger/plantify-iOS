//
//  PlantifyAppApp.swift
//  PlantifyApp
//
//  Created by hyk on 7/16/24.
//

import SwiftUI

@main
struct PlantifyAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Group {
                    if KeyChain.read() == nil {
                        SignInView()
                    }
                    else {
                        HomeView()
                    }
                }
                .navigationBarHidden(true)
                    
            }
        }
    }
}
