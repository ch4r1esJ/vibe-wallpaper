//
//  ButtonColor.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/19/26.
//

import SwiftUI

extension Color {
    
}

extension LinearGradient {
    static var indigoGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(red: 0.45, green: 0.4, blue: 0.95), // light indigo
                Color(red: 0.35, green: 0.25, blue: 0.85)  // slightly deeper indigo
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}
