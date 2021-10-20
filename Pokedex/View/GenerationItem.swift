//
//  GenerationItem.swift
//  Pokedex
//
//  Created by Ramon Almeida on 20/10/21.
//

import SwiftUI

struct GenerationItem: View {
    @State private var isSelected: Bool = false
    var generation: Int
    
    var whenSelected: (Int)->Void
    var whenDeselected: (Int)->Void
    
    var body: some View {
        Button {
            isSelected.toggle()
            if isSelected {
                whenSelected(generation)
            } else {
                whenDeselected(generation)
            }
        } label: {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .foregroundColor(isSelected ? Color(red: 0.917, green: 0.364, blue: 0.376) : Color(red: 0.949, green: 0.949, blue: 0.949))
                LinearGradient(gradient: Gradient(colors: gridGradientColors()), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .mask {
                        Style.Asset.Pattern.grid6x3
                            .resizable()
                            .frame(width: 80, height: 35)
                            .offset(x: -25, y: -45)
                    }
                LinearGradient(gradient: Gradient(colors: pokeballGradientColors()), startPoint: .top, endPoint: .bottom)
                    .mask {
                        Style.Asset.Pattern.pokeball
                            .resizable()
                            .frame(width: 110, height: 110)
                            .edgesIgnoringSafeArea(.all)
                            .offset(x: 35, y: 50)
                    }
                VStack(alignment: .center) {
                    HStack(spacing: -3) {
                        Image("plant-gen-\(generation)", bundle: .main)
                            .frame(width: 45, height: 45)
                        Image("fire-gen-\(generation)", bundle: .main)
                            .frame(width: 45, height: 45)
                        Image("water-gen-\(generation)", bundle: .main)
                            .frame(width: 45, height: 45)
                    }
                    Text("Generation " + generation.romanNumeral)
                        .font(Style.Font.regular.font(16))
                        .foregroundColor(isSelected ? .white : Color(red: 0.454, green: 0.454, blue: 0.462))
                }
                .padding(.top, 30)
                .padding(.bottom, 20)
            }
            .frame(width: 160, height: 139)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
    }
    
    func gridGradientColors() -> [Color] {
        if isSelected {
            return [.white.opacity(0.3), .white.opacity(0)]
        }
        return [Color(red: 0.898, green: 0.898, blue: 0.898, opacity: 1), Color(red: 0.96, green: 0.96, blue: 0.96, opacity: 0)]
    }
    
    func pokeballGradientColors() -> [Color] {
        if isSelected {
            return [.white.opacity(0.3), .white.opacity(0)]
        }
        return [Color(red: 0.925, green: 0.925, blue: 0.925), Color(red: 0.960, green: 0.960, blue: 0.960)]
    }
}

struct GenerationItem_Previews: PreviewProvider {
    static var previews: some View {
        GenerationItem(generation: 1) { selectedGeneration in
            print(selectedGeneration)
        } whenDeselected: { deselectedGeneration in
            print(deselectedGeneration)
        }
    }
}
