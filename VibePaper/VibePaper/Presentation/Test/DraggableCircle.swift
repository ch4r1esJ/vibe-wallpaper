//
//  DraggableCircle.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/17/26.
//

import SwiftUI

struct DraggableCircle: View {
    // 1. Create a state variable to track the movement
    @State private var offset = CGSize.zero

    var body: some View {
        Circle()
            .fill(.blue)
            .frame(width: 100, height: 100)
            // 2. Apply the dynamic offset
            .offset(offset)
            
        
            .gesture(
                DragGesture()
                    .onChanged { value in
                        // 3. Update the state as the finger moves
                        offset = value.translation
                    }
                    .onEnded { _ in
                        // 4. Snap back to original position
                        withAnimation(.spring()) {
                            offset = .zero
                        }
                    }
            )
    }
}

#Preview {
    DraggableCircle()
}
