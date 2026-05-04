//
//  ArtStyle.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/20/26.
//

import SwiftUI

struct ArtStyle: View {
    @Binding var selectedStyle: String
    var rows  = Array(repeating: GridItem(.fixed(270)), count: 1)
    @State private var selected: Int? = nil
    
    var artStyles = [
        ArtStyleItem(name: "Photorealistic", imageName: "style_photorealistic"),
        ArtStyleItem(name: "Watercolor", imageName: "style_watercolor"),
        ArtStyleItem(name: "Oil Painting", imageName: "style_oil_painting"),
        ArtStyleItem(name: "Cyberpunk", imageName: "style_cyberpunk"),
        ArtStyleItem(name: "Anime", imageName: "style_anime"),
        ArtStyleItem(name: "Minimalist", imageName: "style_minimalist"),
        ArtStyleItem(name: "Dark", imageName: "style_dark"),
        ArtStyleItem(name: "Dreamy", imageName: "style_dreamy"),
        ArtStyleItem(name: "Vintage", imageName: "style_vintage"),
        ArtStyleItem(name: "Geometric", imageName: "style_geometric"),
        ArtStyleItem(name: "Surreal", imageName: "style_surreal"),
        ArtStyleItem(name: "Neon", imageName: "style_neon")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 10) {
                ForEach(artStyles.indices, id: \.self) { index in
                    let style = artStyles[index]
                    VStack {
                        Group {
                            if UIImage(named: style.imageName) != nil {
                                Image(style.imageName)
                                    .resizable()
                                    .scaledToFill()
                            } else {
                                Color.indigo.opacity(0.3)
                            }
                        }
                        .frame(width: 240, height: 270)
                        .background(Color.blue)
                            .cornerRadius(25)
                            .clipped() // TODO: Should I leave this
                            .overlay {
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.indigo, lineWidth: selected == index ? 4 : 0)
                            }
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selected = index
                                    selectedStyle = artStyles[index].name
                                }
                            }
                        Text(style.name)
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

//#Preview {
//    ArtStyle()
//}
