//
//  HomeHeaderView.swift
//  Pokedex
//
//  Created by Ramon Almeida on 22/09/21.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        VStack {
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Style.Asset.General.generation
                        .padding(.trailing, 10)
                    Style.Asset.General.sort
                        .padding(.trailing, 10)
                    Style.Asset.General.filter
                }
            }.padding(.bottom, 15)
            HStack {
                VStack(alignment: .leading) {
                    Text("Pokedex")
                        .font(Style.Font.bold.font(32))
                        .foregroundColor(Style.Color.Text.title)
                        .padding(.bottom, 10)
                    Text("Search for Pokémon by name or using the National Pokédex number.")
                        .font(Style.Font.regular.font(16))
                        .foregroundColor(Style.Color.Text.description)
                }
                Spacer()
            }
        }
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
    }
}
