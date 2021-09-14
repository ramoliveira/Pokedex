//
//  HomeView.swift
//  Pokedex
//
//  Created by Ramon Dias on 13/09/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: PokemonViewModel
    
    init(viewModel: PokemonViewModel = Container.shared.resolve(PokemonViewModel.self)!) {
        self.viewModel = viewModel
        self.viewModel.fetchPokemons(fromId: 1, toId: 56)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Search for Pokémon by name or using the National Pokédex number.")
                    .foregroundColor(Style.TextColor.description.color)
                    .padding(.leading)
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(viewModel.pokemons, id: \.id) { pokemon in
                            ZStack {
                                Rectangle()
                                    .frame(height: 115, alignment: .center)
                                    .cornerRadius(10)
                                    .foregroundColor(Style.BackgroundColor.color(pokemon.types.first!))
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(String(format: "#%03d", pokemon.id))
                                            .font(Style.Font.bold.font(12))
                                            .foregroundColor(Style.TextColor.id.color)
                                        Text(pokemon.name)
                                            .font(Style.Font.bold.font(26))
                                            .foregroundColor(Style.TextColor.name.color)
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
                }.navigationTitle("Pokemon")
                .padding(.horizontal, 15)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
