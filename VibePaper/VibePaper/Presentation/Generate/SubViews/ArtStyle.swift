//
//  ArtStyle.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/20/26.
//

import SwiftUI

struct ArtStyle: View {
    var rows  = Array(repeating: GridItem(.flexible()), count: 1)
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 10) {
                ForEach(0...10, id: \.self) { index in
                    VStack {
                        Text("Tab \(index)")
                            .frame(width: 240, height: 270)
                            .background(Color.blue)
                            .cornerRadius(25)
                        Text("Style \(index)")
                            .padding(.top, 15)
                            .foregroundStyle(.indigo)
                            .font(.system(size: 19, weight: .semibold))
                    }
                }
            }
        }
        
    }
}

#Preview {
    ArtStyle()
}
