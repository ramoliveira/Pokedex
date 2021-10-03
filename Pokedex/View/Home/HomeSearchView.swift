//
//  HomeSearchView.swift
//  Pokedex
//
//  Created by Ramon Almeida on 22/09/21.
//

import SwiftUI

struct HomeSearchView: View {
    @Binding var pokemon: String
    
    var body: some View {
        HStack {
            Style.Asset.General.search
                .foregroundColor(Color(red: 0.455, green: 0.455, blue: 0.463))
                .padding(EdgeInsets(top: 20, leading: 25, bottom: 20, trailing: 10))
            TextField("What Pokemon are you looking for?", text: $pokemon)
                .font(Style.Font.regular.font(16))
                .foregroundColor(Color(red: 0.455, green: 0.455, blue: 0.463))
        }.background(Style.Color.View.textField)
            .cornerRadius(10)
    }
}

struct HomeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchView(pokemon: .constant(""))
    }
}
