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
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.96, green: 0.96, blue: 0.96), .white]), startPoint: .top, endPoint: .bottom)
                    .mask {
                        Style.Asset.Pattern.pokeball
                            .resizable()
                            .frame(width: 414, height: 414)
                            .offset(x: 0, y: -190)
                            .edgesIgnoringSafeArea(.all)
                    }.offset(x: 0, y: -240)
                VStack(alignment: .leading) {
                    
                    //MARK: - Buttons
                    VStack(alignment: .trailing) {
                        HStack {
                            Spacer()
                            Button {
                                withAnimation {
                                    showGeneration = true
                                }
                            } label: {
                                Style.Asset.General.generation
                                    .foregroundColor(.black)
                            }.padding(.trailing, 20)
                            
                            Button {
                                withAnimation {
                                    showSort = true
                                }
                            } label: {
                                Style.Asset.General.sort
                                    .foregroundColor(.black)
                            }.padding(.trailing, 20)
                            Button {
                                withAnimation {
                                    showFilter = true
                                }
                            } label: {
                                Style.Asset.General.filter
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    
                    //MARK: - Title and description
                    Text("Pokédex")
                        .foregroundColor(.black)
                        .font(Style.Font.bold.font(32))
                        .padding(.bottom, 10)
                    Text("Search for Pokémon by name or using the National Pokédex number.")
                        .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.46))
                        .font(Style.Font.regular.font(16))
                        .padding(.bottom, 25)
                    
                    //MARK: - Input
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
                    
                    //MARK: - List
                    List {
                        ForEach(pokemons) { pokemon in
                            HomeRow(pokemon: pokemon)
                                .listRowInsets(EdgeInsets())
                        }
                    }.cornerRadius(10)
                    .listStyle(PlainListStyle())
                    .onAppear {
                        UITableView.appearance().backgroundColor = .clear
                    }
                }.padding(.horizontal, 40)
                
                //MARK: - Modals
                Sheet(isShowing: $showGeneration) {
                    Generation()
                }
                Sheet(isShowing: $showFilter) {
                    FilterView()
                }
                Sheet(isShowing: $showSort) {
                    SortView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
