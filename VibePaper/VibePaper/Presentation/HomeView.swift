//
//  HomeView.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/14/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                ButtonView(
                    image: "premiumIcon",
                    action: {
                        print("hi")
                    },
                    width: 35,
                    height: 35,
                    horizontalPadding: 20
                )
                
                Spacer()
                
                ButtonView(
                    image: "settingsIcon",
                    action: {
                        print("hi")
                    },
                    width: 30,
                    height: 30,
                    horizontalPadding: 20
                )
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
