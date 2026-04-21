//
//  GenerateView.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/19/26.
//

import SwiftUI

struct GenerateView: View {
    @State private var prompt: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Describe your desired wallpaper")
                .font(.custom("Bitcount Grid Double Ink", size: 19))
                .foregroundStyle(.indigo)
                .padding(.top)
            
            HStack(alignment: .center) {
                ZStack(alignment: .topLeading) {
                    if prompt.isEmpty && !isFocused {
                        Text("Write anything you’d like")
                            .foregroundStyle(.gray.opacity(0.7))
                            .font(.system(size: 21, weight: .semibold))
                            .padding(.horizontal, 24)
                            .padding(.vertical, 20)
                    }
                    
                    TextEditor(text: $prompt)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(.black)
                        .scrollContentBackground(.hidden)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .focused($isFocused)
                        .frame(height: isFocused ? 250 : 70)
                        .animation(.easeOut(duration: 0.9), value: isFocused)
                        .onChange(of: prompt) { newValue in
                            if newValue.last == "\n" {
                                prompt = String(newValue.dropLast())
                                isFocused = false
                            }
                        }
                }
                Spacer()
                Text("\(prompt.count)/500")
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .padding(.trailing, 16)
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 35))
            .overlay {
                RoundedRectangle(cornerRadius: 35)
                    .stroke(Color.indigo, lineWidth: 2)
            }
            .padding(.horizontal)
            
            PresetPicker(onSelect: { preset in
                if prompt.isEmpty {
                    prompt = preset
                } else {
                    prompt += ", \(preset)"
                }
            })
            .padding(.top, 5)
            
            if !isFocused {
                Text("Choose an art style")
                    .padding(.top)
                    .font(.system(size: 20, weight: .light))
                ArtStyle()
                    .padding(.top, 70)
            }
            
            Spacer()
            
            GenerateButtonView { }
                .padding(.bottom, 15)
        }
        
    }
}

#Preview {
    GenerateView()
}
