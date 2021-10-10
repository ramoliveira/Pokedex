//
//  Row.swift
//  Pokedex
//
//  Created by Ramon Almeida on 10/10/21.
//

import SwiftUI

struct Row: View {
    let pokemon: Pokemon
    
    var body: some View {
        Rectangle()
            .foregroundColor(Style.Color.Pokemon.background(pokemon.types.first!))
            .frame(height: 115)
            .overlay {
                HStack(spacing: 30) {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.3), Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0)]), startPoint: .top, endPoint: .bottom)
                            .mask {
                                Style.Asset.Pattern.grid6x3.resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 74, height: 32)
                                    .offset(x: 40, y: -30)
                            }
                        VStack(alignment: .leading) {
                            Text(String(format: "#%03d", pokemon.id))
                                .font(Style.Font.bold.font(12))
                                .foregroundColor(Style.Color.Text.id)
                            Text(pokemon.name)
                                .font(Style.Font.bold.font(26))
                                .foregroundColor(Style.Color.Text.name)
                                .padding(.bottom, -5)
                            PokemonTypeView(types: pokemon.types)
                                .padding(.all, 0)
                        }
                    }
                    ZStack(alignment: .trailing) {
                        LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.3), Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0)]), startPoint: .top, endPoint: .bottom)
                            .mask {
                                Style.Asset.Pattern.pokeball
                                    .resizable()
                                    .scaledToFill()
                                    .foregroundColor(.white)
                                    .frame(width: 145, height: 115)
                                    .offset(x: 20, y: 0)
                            }
                        pokemon.sprite
                            .resizable()
                            .scaledToFill()
                            .frame(width: 135, height: 135)
                            .offset(x: 20, y: 0)
                    }
                }
            }.cornerRadius(10)
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(pokemon: Pokemon.mock)
    }
}
