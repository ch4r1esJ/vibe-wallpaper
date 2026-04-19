//
//  PresetPicker.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/19/26.
//

import SwiftUI

struct PresetPicker: View {
    @State private var tapped: Preset? = nil
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 7) {
                ForEach(Preset.allCases, id: \.self) { preset in
                    Text(preset.rawValue)
                        .foregroundStyle(.indigo)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 14)
                        .fontWeight(.medium)
                        .background {
                            Rectangle()
                                .fill(Color.indigo.opacity(tapped == preset ? 0.4 : 0.2))
                                .cornerRadius(14)
                        }
                        .scaleEffect(tapped == preset ? 1.05 : 1.0)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                tapped = preset
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.spring()) {
                                    tapped = nil
                                }
                            }
                        }
                }
            }
            .padding(9)
        }
        .contentMargins(.leading, 16, for: .scrollContent)
    }
}

enum Preset: String, CaseIterable {
    case abstract = "Abstract"
    case art = "Art"
    case music = "Music"
    case future = "Future"
    case fun = "Fun"
    case nature = "Nature"
    case animals = "Animals"
    case technology = "Technology"
    case architecture = "Architecture"
    case people = "People"
    case travel = "Travel"
    case food = "Food"
    case sports = "Sports"
    case fashion = "Fashion"
    case space = "Space"
    case cars = "Cars"
    case minimal = "Minimal"
    case vintage = "Vintage"
    case dark = "Dark"
    case aesthetic = "Aesthetic"
    case city = "City"
    case ocean = "Ocean"
    case mountains = "Mountains"
    case sunset = "Sunset"
    case night = "Night"
    case street = "Street"
    case fantasy = "Fantasy"
    case gaming = "Gaming"
    case sciFi = "Sci-Fi"
    case cyberpunk = "Cyberpunk"
}

#Preview {
    PresetPicker()
}
