//
//  GenerateButtonView.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/16/26.
//

import SwiftUI

struct GenerateButtonView: View {
    var body: some View {
        Button {
            print("Watever")
        } label: {
            HStack(spacing: 15) {
//                Image(systemName: "sparkles")
//                    .scaleEffect(2)
//                    .symbolEffect(.wiggle)
                FloatingSparklesView()
                
                Text("Generate Wallpaper")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .fontWeight(.bold)
            }
            
            .padding(.vertical, 20)
            .padding(.horizontal, 40)
            .background {
                Capsule()
                    .fill(.indigo.shadow(.drop(color: .indigo,radius: 10)))
                    .fill(.indigo.shadow(.inner(color: .black, radius: 1)))
                    .shadow(color: .indigo, radius: 3)
            }
        }
        
    }
}

#Preview {
    GenerateButtonView()
}

struct FloatingSparklesView: View {
    var body: some View {
        TimelineView(.animation) { context in
            let angle = context.date.timeIntervalSinceReferenceDate * 1.5
            
            ZStack {
                Image(systemName: "sparkle")
                    .font(.system(size: 16))
                    .foregroundStyle(.blue)
                    .offset(
                        x: cos(angle) * 12,
                        y: sin(angle) * 8
                    )
                
                Image(systemName: "sparkle")
                    .font(.system(size: 20))
                    .foregroundStyle(.blue)
                    .offset(
                        x: cos(angle + 2.1) * 10,
                        y: sin(angle + 2.1) * 10
                    )
                
                Image(systemName: "sparkle")
                    .font(.system(size: 14))
                    .foregroundStyle(.blue)
                    .offset(
                        x: cos(angle + 4.2) * 14,
                        y: sin(angle + 4.2) * 6
                    )
            }
            .offset(x: -7, y: 3)
        }
    }
}
