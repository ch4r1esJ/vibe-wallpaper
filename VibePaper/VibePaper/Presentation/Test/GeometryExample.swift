//
//  GeometryExample.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/17/26.
//

import SwiftUI

struct GeometryExample: View {
    var body: some View {
        VStack {
            Text("Item 131323ddddddddddddd123asd")
            
                .background {
                    GeometryReader { geo in
                        
                    }
                    .background(.red)
                }
                    
                
        }
    }
}

#Preview {
    GeometryExample()
}
