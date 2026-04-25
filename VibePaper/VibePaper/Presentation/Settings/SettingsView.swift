//
//  SettingsView.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/24/26.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Text("Settings")
                    .font(.headline)
                    .fontWeight(.bold)
                
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.black)
                            .padding(10)
                            .background(Color.gray.opacity(0.15))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            
            ScrollView {
                VStack(spacing: 20) {
                    ZStack(alignment: .bottomLeading) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(LinearGradient(
                                colors: [.purple, .indigo, .blue],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .frame(height: 220)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Get access to all the exclusive\nfeatures of VibePaper!")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)
                            
                            Button {
                            } label: {
                                HStack(spacing: 10) {
                                    Image(systemName: "crown.fill")
                                    Text("Become a PRO")
                                        .fontWeight(.bold)
                                }
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(Color.indigo)
                                .clipShape(Capsule())
                            }
                        }
                        .padding()
                    }
                    .padding(.horizontal)
                    
                    VStack(spacing: 12) {
                        SettingsRow(icon: "folder.fill", iconColor: .indigo, title: "My Wallpapers")
                        SettingsRow(icon: "star.fill", iconColor: .indigo, title: "Rate Us")
                    }
                    .padding(.horizontal)
                    
                    Spacer(minLength: 40)
                    
                    HStack(spacing: 0) {
                        BottomLink(icon: "lock.shield", title: "Privacy Policy")
                        BottomLink(icon: "arrow.counterclockwise", title: "Restore Purchases")
                        BottomLink(icon: "doc.text", title: "Terms of Use")
                    }
                    .padding(.horizontal)
                    
                    Text("VibePaper v1.0.0")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                }
                .padding(.top)
            }
        }
    }
}

struct SettingsRow: View {
    let icon: String
    let iconColor: Color
    let title: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .foregroundStyle(.white)
                .frame(width: 40, height: 40)
                .background(iconColor)
                .clipShape(Circle())
            
            Text(title)
                .font(.system(size: 16, weight: .semibold))
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
                .font(.system(size: 14))
        }
        .padding(.vertical, 8)
    }
}

struct BottomLink: View {
    let icon: String
    let title: String
    
    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundStyle(.gray)
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            Text("asdasd")
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SettingsView()
}
