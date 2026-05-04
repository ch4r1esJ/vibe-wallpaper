//
//  GenerateViewModel.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/19/26.
//

import Foundation
import Combine
import SwiftUI

class GenerateViewModel: ObservableObject {
    @Published var prompt = ""
    @Published var selectedArtStyle: String = ""
    @Published var fullPromptEnhancements: String = ""
    
    func generateImage(coordinator: AppCoordinator) async {
        let styleText = selectedArtStyle.isEmpty ? "" : ", \(selectedArtStyle) art style"
        let enhancerText = fullPromptEnhancements.isEmpty ? "" : ", \(fullPromptEnhancements)"
        
        let fullPrompt = """
        You are a wallpaper generator for iPhone. Always generate a high quality portrait orientation 9:16 wallpaper image. Never respond with text only. Always produce an image. Make it visually stunning, suitable as a phone wallpaper.

        Generate a wallpaper of: \(prompt)\(styleText)\(enhancerText). Dramatic composition, visually stunning.
        """
        
        print("=== PROMPT SENT TO GEMINI ===")
            print(fullPrompt)
            print("=============================")
        
        var request = URLRequest(url: URL(string: "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-image:generateContent")!)
        
        request.setValue(Secrets.geminiAPIKey, forHTTPHeaderField: "x-goog-api-key")
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "contents": [["parts": [["text": fullPrompt]]]],
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
                            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                            coordinator.navigate(to: .wallpaperResult(image))
                        }
                    }
                    return
                }
            }
        }
    }
}
