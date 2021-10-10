//
//  HomeView.swift
//  Pokedex
//
//  Created by Ramon Dias on 13/09/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: PokemonViewModel
    
    @State var showGeneration: Bool = false
    @State var showFilter: Bool = false
    @State var showSort: Bool = false
    
    init(viewModel: PokemonViewModel = SContainer.shared.resolve(PokemonViewModel.self)!) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                PokeballHeaderView()
                VStack(alignment: .leading) {
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            ForEach(viewModel.dataSource, id: \.id) { pokemon in
                                Text(pokemon.name)
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

fileprivate struct PokeballHeaderView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.gray]), startPoint: .top, endPoint: .bottom)
            .mask {
                Style.Asset.Pattern.pokeball
                    .resizable()
                    .opacity(0.05)
                    .frame(width: 414, height: 414)
                    .offset(x: 0, y: -190)
                    .edgesIgnoringSafeArea(.all)
            }.offset(x: 0, y: -190)
    }
}
