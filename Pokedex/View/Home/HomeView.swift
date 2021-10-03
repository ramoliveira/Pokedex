//
//  HomeView.swift
//  Pokedex
//
//  Created by Ramon Dias on 13/09/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: PokemonViewModel
    
    init(viewModel: PokemonViewModel = SContainer.shared.resolve(PokemonViewModel.self)!) {
        self.viewModel = viewModel
//        self.viewModel.fetchPokemons(fromId: 1, toId: 10)
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                LinearGradient(gradient: Gradient(colors: [.gray, .clear]), startPoint: .top, endPoint: .bottom)
                    .mask {
                    Style.Asset.Pattern.pokeball
                        .resizable()
                        .opacity(0.05)
                        .frame(width: .infinity, height: 414)
                        .offset(x: 0, y: -190)
                        .edgesIgnoringSafeArea(.all)
                    }.offset(x: 0, y: -190)
                VStack(alignment: .leading) {
                    HomeHeaderView()
                        .padding(.bottom, 25)
                    HomeSearchView(pokemon: $viewModel.pokemon)
                        .padding(.bottom, 45)
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            ForEach(viewModel.dataSource, id: \.id) { pokemon in
                                PokemonCellView(pokemon: pokemon)
                            }
                        }
                    }
                }.padding(.horizontal, 40)
                .padding(.top, -80)
            }
        }.navigationBarHidden(true)
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: PokemonViewModelMock())
            .preferredColorScheme(.light)
    }
}
