//
//  HomeHeaderView.swift
//  Pokedex
//
//  Created by Ramon Almeida on 22/09/21.
//

import SwiftUI

struct HomeHeaderView: View {
    @Binding var showGeneration: Bool
    @Binding var showFilter: Bool
    @Binding var showSort: Bool
    
    var body: some View {
        VStack {
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Button {
                        showGeneration = !showGeneration
                    } label: {
                        Style.Asset.General.generation
                            .padding(.trailing, 10)
                            .foregroundColor(.black)
                    }
                    Button {
                        showSort = !showSort
                    } label: {
                        Style.Asset.General.sort
                            .padding(.trailing, 10)
                            .foregroundColor(.black)
                    }
                    Button {
                        showFilter = !showFilter
                    } label: {
                        Style.Asset.General.filter
                            .foregroundColor(.black)
                    }
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
    @State static var sG: Bool = false
    @State static var sF: Bool = false
    @State static var sS: Bool = false
    
    static var previews: some View {
        HomeHeaderView(showGeneration: $sG, showFilter: $sF, showSort: $sS)
    }
}
