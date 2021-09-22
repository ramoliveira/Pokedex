//
//  PokemonCellView.swift
//  Pokedex
//
//  Created by Ramon Almeida on 22/09/21.
//

import SwiftUI

struct PokemonCellView: View {
    @State var pokemon: Pokemon
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 115, alignment: .center)
                .cornerRadius(10)
                .foregroundColor(Style.Color.Pokemon.background(pokemon.types.first!))
            HStack {
                VStack(alignment: .leading) {
                    Text(String(format: "#%03d", pokemon.id))
                        .font(Style.Font.bold.font(12))
                        .foregroundColor(Style.Color.Text.id)
                    Text(pokemon.name)
                        .font(Style.Font.bold.font(26))
                        .foregroundColor(Style.Color.Text.name)
                    PokemonTypeView(types: pokemon.types)
                        .padding(.all, 0)
                }.padding(.leading, 20)
                Spacer()
                pokemon.sprite
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .padding(.trailing, 20)
            }
        }
    }
}

struct PokemonCellView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCellView(pokemon: Pokemon(
                id: 1,
                name: "Ditto",
                height: 20,
                weight: 20,
                sprite: Image(uiImage: UIImage()),
                types: ["Normal"]
            )
        )
    }
}
