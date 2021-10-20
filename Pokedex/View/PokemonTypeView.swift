//
//  PokemonTypeView.swift
//  Pokedex
//
//  Created by Ramon Dias on 16/09/21.
//

import SwiftUI

struct PokemonTypeView: View {
    let types: [PokemonType]

    var body: some View {
        HStack {
            ForEach(types, id: \.id) { type in
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 3, style: .circular)
                        .foregroundColor(Style.Color.Pokemon.type(type))
                    HStack(spacing: 0) {
                        Image("Type-"+type.rawValue)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 15, height: 15, alignment: .center)
                            .padding(.all, 5)
                        Text(type.rawValue)
                            .font(Style.Font.medium.font(12))
                            .foregroundColor(.white)
                            .padding(.trailing, 5)
                    }
                }
                .frame(minWidth: 65, maxWidth: 75)
            }
        }
        .frame(height: 25)
    }
}

struct PokemonTypeView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypeView(types: [.grass, .bug])
    }
}
