//
//  GenerateView.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/19/26.
//

import SwiftUI

struct GenerateView: View {
    @FocusState private var isFocused: Bool
    @State private var isExpanded: Bool = false
    @StateObject private var viewModel = GenerateViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Describe your desired wallpaper")
                .font(.custom("Bitcount Grid Double Ink", size: 19))
                .foregroundStyle(.indigo)
                .padding(.top)
            Textfield
            
            PresetPicker(onSelect: { preset in
                if viewModel.prompt.isEmpty {
                    viewModel.prompt = preset
                } else {
                    viewModel.prompt += ", \(preset)"
                }
            })
            .padding(.top, 5)
            
            if !isExpanded {
                VStack(spacing: 10) {
                    Text("Choose an art style")
                        .font(.system(size: 20, weight: .light))
                        .transition(.opacity.combined(with: .move(edge: .bottom)))
                    
                    ArtStyle()
                        .transition(.opacity.combined(with: .move(edge: .bottom)))
                }
                .padding(.top, 70)
            }
            
            Spacer()
            
            GenerateButtonView {
                Task {
                    await viewModel.generateImage()
                }
            }
            .padding(.bottom, 15)
        }
        .animation(.easeOut(duration: 0.3), value: isExpanded)
        
    }
    
    private var Textfield: some View {
        HStack(alignment: isFocused ? .bottom : .center) {
            ZStack(alignment: .topLeading) {
                if viewModel.prompt.isEmpty && !isFocused {
                    Text("Write anything you'd like")
                        .foregroundStyle(.gray.opacity(0.7))
                        .font(.system(size: 21, weight: .semibold))
                        .padding(.horizontal, 24)
                        .padding(.vertical, 20)
                }
                
                TextEditor(text: $viewModel.prompt)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(.black)
                    .scrollContentBackground(.hidden)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .focused($isFocused)
                    .frame(height: isFocused ? 250 : 70)
                    .animation(.easeOut(duration: 0.3), value: isFocused)
                    .onChange(of: viewModel.prompt) { newValue in
                        if newValue.last == "\n" {
                            viewModel.prompt = String(newValue.dropLast())
                            isFocused = false
                        }
                    }
                    .onChange(of: isFocused) { newValue in
                        if newValue {
                            isExpanded = true
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation(.easeOut(duration: 0.3)) {
                                    isExpanded = false
                                }
                            }
                        }
                    }
            }
            Spacer()
            Text("\(viewModel.prompt.count)/500")
                .foregroundStyle(.gray)
                .font(.subheadline)
                .padding(.trailing, 16)
                .padding(.bottom, isFocused ? 10 : 0)
                .animation(nil, value: isFocused)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 35))
        .overlay {
            RoundedRectangle(cornerRadius: 35)
                .stroke(Color.indigo, lineWidth: 2)
        }
        .padding(.horizontal)
    }
}

#Preview {
    GenerateView()
}
