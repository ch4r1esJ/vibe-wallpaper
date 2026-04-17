//
//  test.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/17/26.
//

import SwiftUI

struct ScrollTestView: View {
    @State private var offset: CGFloat = 0
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(0...30, id: \.self) { i in
                    Text("Item \(i)")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                

                Image(systemName: "hand.draw")
                    .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged {
                                dragAmount = $0.translation
                            }
                    )
                Text("Hello, World!")
                    .onAppear {
                        print("View has appeared!")
                    }
            }
            .background(
                GeometryReader { geo in
                    Color.clear
                        .onAppear {
                            offset = geo.frame(in: .global).minY
                        }
                        .onChange(of: geo.frame(in: .global).minY) { val in
                            offset = val
                        }
                }
            )
        }
        .overlay(alignment: .top) {
            Text("Offset: \(Int(offset))")
                .padding()
                .background(.black)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ScrollTestView()
}
