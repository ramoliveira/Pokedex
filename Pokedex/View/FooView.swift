//
//  FooView.swift
//  Pokedex
//
//  Created by Ramon Almeida on 08/10/21.
//

import SwiftUI

struct FooView: View {
    @State var showGeneration: Bool = false
    @State var showFilter: Bool = false
    @State var showSort: Bool = false
    
    var body: some View {
        VStack {
            HomeHeaderView(showGeneration: $showGeneration,
                           showFilter: $showFilter,
                           showSort: $showSort)
        }.sheet(isPresented: $showGeneration) {
            VStack {
                Text("Generation")
            }.frame(height: 400, alignment: .center)
        }.sheet(isPresented: $showFilter) {
            VStack {
                Text("Filter")
            }.frame(height: 400, alignment: .center)
        }.sheet(isPresented: $showSort) {
            VStack {
                Text("Sort")
            }.frame(height: 400, alignment: .center)
        }
    }
}

struct FooView_Previews: PreviewProvider {
    static var previews: some View {
        FooView()
    }
}
