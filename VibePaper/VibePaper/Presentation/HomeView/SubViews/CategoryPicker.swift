//
//  CategoryPicker.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/17/26.
//

import SwiftUI

struct CategoryPicker: View {
    @State private var selection = "Abstract"
        
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 2) {
                ForEach(Category.allCases, id: \.self) { category in
                    Text(category.rawValue)
                        .foregroundStyle(selection == category.rawValue ? .white : .indigo)
                        .padding(10)
                        .padding(.horizontal, 6)
                        .fontWeight(.medium)
                        .background {
                            Rectangle()
                                .fill(selection == category.rawValue ? Color.indigo : Color.clear)
                                .cornerRadius(20)
                        }
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selection = category.rawValue
                            }
                        }
                    
                        
                }
            }
            .padding(9)
            .background {
                Capsule()
                    .fill(.indigo.opacity(0.15))
            }
        }
        .contentMargins(.leading, 16, for: .scrollContent)
    }
}

#Preview {
    CategoryPicker()
}

enum Category: String, CaseIterable {
    case abstract = "Abstract"
    case art = "Art"
    case music = "Music"
    case future = "Future"
    case fun = "Fun"
    case nature = "Nature"
    case animals = "Animals"
    case technology = "Technology"
    case architecture = "Architecture"
    case people = "People"
    case travel = "Travel"
    case food = "Food"
    case sports = "Sports"
    case fashion = "Fashion"
    case space = "Space"
    case cars = "Cars"
    case minimal = "Minimal"
    case vintage = "Vintage"
    case dark = "Dark"
    case aesthetic = "Aesthetic"
    case city = "City"
    case ocean = "Ocean"
    case mountains = "Mountains"
    case sunset = "Sunset"
    case night = "Night"
    case street = "Street"
    case fantasy = "Fantasy"
    case gaming = "Gaming"
    case sciFi = "Sci-Fi"
    case cyberpunk = "Cyberpunk"
}
