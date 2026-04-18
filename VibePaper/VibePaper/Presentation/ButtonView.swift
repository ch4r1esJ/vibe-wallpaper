//
//  ButtonView.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/15/26.
//

import SwiftUI

struct ButtonView: View {
    var image: String
    var action: () -> Void
    var width: CGFloat
    var height: CGFloat
    var horizontalPadding: CGFloat
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(image)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
                .foregroundStyle(.white)
        }
        .padding(.horizontal, horizontalPadding)

    }
}

