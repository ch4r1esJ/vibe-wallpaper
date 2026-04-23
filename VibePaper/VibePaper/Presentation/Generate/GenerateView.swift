//
//  GenerateView.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/19/26.
//

import SwiftUI

struct GenerateView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    
    @State private var prompt: String = ""
    @FocusState private var isFocused: Bool
    @State private var isExpanded: Bool = false

    
    @State private var userPrompt = ""
    @State private var aiResponse = ""
    @State private var isLoading = false
    @State private var generatedImage: UIImage? = nil
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Describe your desired wallpaper")
                .font(.custom("Bitcount Grid Double Ink", size: 19))
                .foregroundStyle(.indigo)
                .padding(.top)
            
            HStack(alignment: .center) {
                ZStack(alignment: .topLeading) {
                    if prompt.isEmpty && !isFocused {
                        Text("Write anything you'd like")
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
                        .animation(.easeOut(duration: 0.3), value: isFocused)
                        .onChange(of: prompt) { newValue in
                            if newValue.last == "\n" {
                                prompt = String(newValue.dropLast())
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
            
            if let image = generatedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            
            GenerateButtonView {
                Task {
                    await generateImage()
                }
            }
            .padding(.bottom, 15)
        }
        .animation(.easeOut(duration: 0.3), value: isExpanded)
        
    }

    func generateImage() async {
        var request = URLRequest(url: URL(string: "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-image:generateContent")!)
        request.setValue(Secrets.geminiAPIKey, forHTTPHeaderField: "x-goog-api-key")
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "contents": [["parts": [["text": prompt]]]],
            "generationConfig": ["responseModalities": ["TEXT", "IMAGE"]]
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        guard let (data, _) = try? await URLSession.shared.data(for: request) else { return }
        
        print(String(data: data, encoding: .utf8) ?? "no data")
        
        if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
           let candidates = json["candidates"] as? [[String: Any]],
           let content = candidates.first?["content"] as? [String: Any],
           let parts = content["parts"] as? [[String: Any]] {
            
            for part in parts {
                if let inlineData = part["inlineData"] as? [String: Any],
                   let base64String = inlineData["data"] as? String,
                   let imageData = Data(base64Encoded: base64String) {
                    await MainActor.run {
                        if let image = UIImage(data: imageData) {
                            coordinator.navigate(to: .wallpaperResult(image))
                        }
                    }
                    return
                }
            }
        }
    }
}

#Preview {
    GenerateView()
}
