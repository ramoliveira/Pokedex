//
//  PokemonTypeView.swift
//  Pokedex
//
//  Created by Ramon Dias on 16/09/21.
//

import SwiftUI

struct PokemonTypeView: View {
    @State var types: [PokemonType]
    
    var body: some View {
        HStack {
            ForEach(types, id: \.id) { type in
                ZStack {
                    Rectangle()
                        .cornerRadius(3)
                        .foregroundColor(Style.TypeColor.color(type))
                    HStack {
                        Image(type.rawValue)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 15, height: 15, alignment: .center)
                            .padding(.all, 5)
                        Text(type.rawValue)
                            .font(Style.Font.medium.font(12))
                            .foregroundColor(.white)
                            .padding(.all, 5)
                    }
                }
            }.frame(height: 25, alignment: .center)
        }.frame(minWidth: 0, idealWidth: 100, maxWidth: 200, alignment: .leading)
    }
}

struct PokemonTypeView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypeView(types: [.grass, .bug])
    }
}
