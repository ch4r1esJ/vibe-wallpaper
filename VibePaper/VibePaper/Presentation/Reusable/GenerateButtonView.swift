//
//  GenerateButtonView.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/16/26.
//

import SwiftUI

struct GenerateButtonView: View {
    @State private var pulse1 = false
    @State private var pulse2 = false
    @State private var pulse3 = false
    var action: () -> ()
    
    var body: some View {
        
        Button {
            action()
        } label: {
            HStack(spacing: 15) {
                FloatingSparklesView()
                
                Text("Generate Wallpaper")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 40)
            .background {
                ZStack {
                    Capsule()
                        .fill(Color.indigo.opacity(0.15))
                        .scaleEffect(x: pulse3 ? 1.35 : 1.0, y: pulse3 ? 1.6 : 1.0)
                        .opacity(pulse3 ? 0 : 1)
                    
                    Capsule()
                        .fill(Color.indigo.opacity(0.25))
                        .scaleEffect(x: pulse2 ? 1.25 : 1.0, y: pulse2 ? 1.45 : 1.0)
                        .opacity(pulse2 ? 0 : 1)
                    
                    Capsule()
                        .fill(Color.indigo.opacity(0.35))
                        .scaleEffect(x: pulse1 ? 1.15 : 1.0, y: pulse1 ? 1.3 : 1.0)
                        .opacity(pulse1 ? 0 : 1)
                    
                    Capsule()
                        .fill(LinearGradient.indigoGradient)
                        .shadow(color: .indigo, radius: 15)
                }
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1.8).repeatForever(autoreverses: false)) {
                pulse1 = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(.easeOut(duration: 1.8).repeatForever(autoreverses: false)) {
                    pulse2 = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                withAnimation(.easeOut(duration: 1.8).repeatForever(autoreverses: false)) {
                    pulse3 = true
                }
            }
        }
    }
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
