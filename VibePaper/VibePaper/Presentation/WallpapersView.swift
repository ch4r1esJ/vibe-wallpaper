//
//  WallpapersView.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/16/26.
//

import SwiftUI

struct WallpapersView: View {
    
    var columns  = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(0...100, id: \.self) { index in
                Text("Tab \(index)")
                    .frame(width: 105, height: 180)
                    .background(Color.blue)
                    .cornerRadius(25)
            }
        }
        .padding(.horizontal)
    }
    
}

#Preview {
    WallpapersView()
}
