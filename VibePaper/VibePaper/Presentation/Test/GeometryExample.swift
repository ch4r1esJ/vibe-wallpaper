import SwiftUI

struct GeometryExample: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Parent Container")
                .font(.headline)
            
            // The GeometryReader takes up the available space in the VStack
            GeometryReader { proxy in
                VStack(spacing: 10) {
                    // We use 'proxy.size' to calculate dimensions
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: proxy.size.width * 0.8, height: 50)
                        .overlay(Text("80% Width").foregroundColor(.white))
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: proxy.size.width * 0.4, height: 50)
                        .overlay(Text("40% Width").foregroundColor(.white))
                    
                    Text("Total Width: \(Int(proxy.size.width))pt")
                        .font(.caption)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(Color.gray.opacity(0.2))
            .border(Color.black)
            .padding()
        }
    }
}