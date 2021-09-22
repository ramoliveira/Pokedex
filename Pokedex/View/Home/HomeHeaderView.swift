//
//  HomeHeaderView.swift
//  Pokedex
//
//  Created by Ramon Almeida on 22/09/21.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Pokedex")
                .font(Style.Font.bold.font(32))
                .foregroundColor(Style.Color.Text.title)
                .padding(.bottom, 10)
            Text("Search for Pokémon by name or using the National Pokédex number.")
                .frame(alignment: .center)
                .font(Style.Font.regular.font(16))
                .foregroundColor(Style.Color.Text.description)
        }
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
    }
}
