//
//  HomeView.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/14/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isCollapsed = false
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    Image("headerImage")
                        .resizable()
                        .scaledToFill()
                        .frame(height: isCollapsed ? 230 : 335)
                        .clipShape(.rect(bottomLeadingRadius: 30, bottomTrailingRadius: 30))
                    
                    headerView
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 70)
                    
                    if !isCollapsed {
                        GenerateButtonView {
                            coordinator.navigate(to: .generateView)
                        }
                        .padding(.top, 300)
                        .transition(.opacity)
                    }
                }
                .frame(height: isCollapsed ? 230 : 365)
                .ignoresSafeArea(edges: .top)
                
                CategoryPicker()
                    .padding(.vertical, 16)
                
                ScrollView {
                    WallpapersView()
                        .padding(.horizontal, 9)
                        .background(
                            GeometryReader { geo in
                                Color.clear
                                    .onChange(of: geo.frame(in: .named("scroll")).minY) { newValue in
                                        let shouldCollapse = isCollapsed ? newValue < -30 : newValue < -50
                                        if shouldCollapse != isCollapsed {
                                            DispatchQueue.main.async {
                                                withAnimation(.easeOut(duration: 0.4)) {
                                                    isCollapsed = shouldCollapse
                                                }
                                            }
                                        }
                                    }
                            }
                        )
                }
                .coordinateSpace(name: "scroll")
                .overlay(alignment: .top) {
                    if isCollapsed {
                        GenerateButtonView {
                            coordinator.navigate(to: .generateView)
                        }
                        
                        .padding(.top, 450)
                        .transition(.opacity)
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
        
        
    }
    
    private var headerView: some View {
        HStack {
            ButtonView(
                image: "premiumIcon",
                action: {
                    print("hi")
                },
                width: 40,
                height: 50,
                horizontalPadding: 30
            )
            
            Spacer()
            
            
            Text("Vibe AI")
                .font(.custom("Bitcount Grid Double Ink", size: 30))
                .foregroundStyle(.white)
            
            Spacer()
            
            ButtonView(
                image: "settingsIcon",
                action: {
                    print("hi")
                },
                width: 40,
                height: 40,
                horizontalPadding: 30
            )
        }
    }
}

#Preview {
    HomeView()
}
