//
//  WallpaperResultView.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/23/26.
//

import SwiftUI

struct WallpaperResultView: View {
    let image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .ignoresSafeArea()
    }
}
