//
//  PresetPicker.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/19/26.
//

import SwiftUI

struct PresetPicker: View {
    @State private var tapped: Preset? = nil
    var onSelect: (String, String) -> Void
    
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
                                .fill(Color.indigo.opacity(tapped == preset ? 0.4 : 0.1))
                                .cornerRadius(14)
                        }
                        .scaleEffect(tapped == preset ? 1.05 : 1.0)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                tapped = preset
                            }
                            onSelect(preset.rawValue, preset.promptText)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.spring()) {
                                    tapped = nil
                                }
                            }
                        }
                }
            }
        }
        .contentMargins(.leading, 15, for: .scrollContent)
    }
}

enum Preset: String, CaseIterable {
    case cinematic = "Cinematic"
    case dramatic = "Dramatic Lighting"
    case moody = "Moody Atmosphere"
    case vibrant = "Vibrant Colors"
    case ethereal = "Ethereal Glow"
    case minimal = "Ultra Minimal"
    case detailed = "Ultra Detailed"
    case dreamy = "Dreamy Soft Focus"
    
    var promptText: String {
        switch self {
        case .cinematic: return "cinematic composition, film quality"
        case .dramatic: return "dramatic lighting, strong shadows and highlights"
        case .moody: return "moody dark atmosphere, emotional depth"
        case .vibrant: return "vibrant saturated colors, eye-catching palette"
        case .ethereal: return "ethereal soft glow, otherworldly light"
        case .minimal: return "ultra minimalist, clean and simple"
        case .detailed: return "ultra detailed, intricate textures, 8K quality"
        case .dreamy: return "dreamy soft focus, pastel tones, hazy light"
        }
    }
}

//#Preview {
//    PresetPicker()
//}
