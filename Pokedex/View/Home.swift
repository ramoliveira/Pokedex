//
//  Home.swift
//  Pokedex
//
//  Created by Ramon Almeida on 09/10/21.
//

import SwiftUI

struct Home: View {
    let pokemon = Pokemon.mock
    var pokemons: [Pokemon] {
        return [pokemon]
    }
    
    @State var showGeneration: Bool = false
    @State var showFilter: Bool = false
    @State var showSort: Bool = false
    
    @State var input: String = ""
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Style.Asset.Pattern.pokeball
                    .resizable()
                    .frame(height: 414, alignment: .center)
                    .opacity(0.05)
                    .offset(x: 0, y: -190)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .trailing) {
                        HStack {
                            Spacer()
                            Button {
                                showGeneration = !showGeneration
                            } label: {
                                Style.Asset.General.generation
                                    .foregroundColor(.black)
                            }
                            Button {
                                showSort = !showSort
                            } label: {
                                Style.Asset.General.sort
                                    .foregroundColor(.black)
                            }
                            Button {
                                showFilter = !showFilter
                            } label: {
                                Style.Asset.General.filter
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    
                    Text("Pokédex")
                        .foregroundColor(.black)
                        .font(Style.Font.bold.font(32))
                        .padding(.bottom, 10)
                    Text("Search for Pokémon by name or using the National Pokédex number.")
                        .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.46))
                        .font(Style.Font.regular.font(16))
                        .padding(.bottom, 25)
                    
                    HStack {
                        Style.Asset.General.search
                            .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.46))
                            .padding(.leading, 5)
                        TextField("What Pokémon are you looking for?", text: $input)
                            .font(Style.Font.regular.font(16))
                            .padding(.leading, 10)
                    }.padding()
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                    
                    List {
                        ForEach(pokemons) { pokemon in
                            ZStack {
                                VStack {
                                    Text(pokemon.name)
                                }
                            }.frame(height: 115)
                        }
                    }.cornerRadius(10)
                }.padding(.horizontal, 40)
            }.sheet(isPresented: $showGeneration) {
                Text("Generation")
            }.sheet(isPresented: $showFilter) {
                Text("Filter")
            }.sheet(isPresented: $showSort) {
                Text("Sort")
            }.navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
