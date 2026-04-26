//
//  MyWallpapersView.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/26/26.
//


import SwiftUI

struct MyWallpapersView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedTab = "Generated"
    let tabs = ["Generated", "Favorites"]
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Text("My Wallpapers")
                    .font(.title2)
                    .fontWeight(.bold)
                
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                            .padding(12)
                            .background(Color.gray.opacity(0.15))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { tab in
                    Button {
                        withAnimation(.spring()) {
                            selectedTab = tab
                        }
                    } label: {
                        Text(tab)
                            .fontWeight(.semibold)
                            .foregroundStyle(selectedTab == tab ? .white : .indigo)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(
                                Capsule()
                                    .fill(selectedTab == tab ? Color.indigo : Color.clear)
                            )
                    }
                }
            }
            .padding(6)
            .background(Color.indigo.opacity(0.15))
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.bottom)
            
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                    ForEach(0..<12, id: \.self) { _ in
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.gray.opacity(0.2))
                            .aspectRatio(0.6, contentMode: .fit)
                    }
                }
                .padding(.horizontal)
                
                VStack(spacing: 12) {
                    Text("Get access to all the exclusive features of VibePaper!")
                        .font(.system(size: 16, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Button {
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "crown.fill")
                            Text("Become a PRO")
                                .fontWeight(.bold)
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(
                            LinearGradient(
                                colors: [.indigo, .purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(Capsule())
                        .shadow(color: .indigo.opacity(0.4), radius: 10, y: 5)
                    }
                }
                .padding(20)
                .background(Color.gray.opacity(0.08))
                .cornerRadius(20)
                .padding(.horizontal)
                .padding(.top, 20)
                .padding(.bottom)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    MyWallpapersView()
}
