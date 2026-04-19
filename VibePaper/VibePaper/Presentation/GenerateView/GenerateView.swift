//
//  GenerateView.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/19/26.
//

import SwiftUI

struct GenerateView: View {
    @State private var prompt: String = ""
    var body: some View {
        VStack(spacing: 10) {
            Text("Describe the walpaper you want to create in detail")
            TextField("Enter description", text: $prompt)
            PresetPicker()
        }
    }
}

#Preview {
    GenerateView()
}
