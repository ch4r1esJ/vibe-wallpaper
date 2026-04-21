//
//  ArtStyle.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/20/26.
//

import SwiftUI

struct ArtStyle: View {
    var rows  = Array(repeating: GridItem(.fixed(270)), count: 1)
    @State private var selected: Int? = nil
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 10) {
                ForEach(0...10, id: \.self) { index in
                    VStack {
                        Text("Tab \(index)")
                            .frame(width: 240, height: 270)
                            .background(Color.blue)
                            .cornerRadius(25)
                            .overlay {
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.indigo, lineWidth: selected == index ? 4 : 0)
                            }
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selected = index
                                }
                            }
                        Text("Style \(index)")
                            .padding(.top, 15)
                            .foregroundStyle(.indigo)
                            .font(.system(size: 19, weight: .semibold))
                    }
                }
            }
        }
        .frame(height: 330)
        .contentMargins(.leading, 15, for: .scrollContent)
        .contentMargins(.trailing, 15, for: .scrollContent)
//        .contentMargins(.top, 10, for: .scrollContent)
    }
}

#Preview {
    ArtStyle()
}
