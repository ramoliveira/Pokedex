//
//  Generation.swift
//  Pokedex
//
//  Created by Ramon Almeida on 20/10/21.
//

import SwiftUI

struct Generation: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    @State var selectedGenerations: [Int] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("Generations")
                    .font(Style.Font.bold.font(26))
                    .padding(.bottom, 5)
                    .padding(.top, 30)
                Text("Use search for generations to explore your Pokémon!")
                    .font(Style.Font.regular.font(16))
                    .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.46))
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 35)
            }
            
            LazyVGrid(columns: columns) {
                ForEach(1...8, id: \.self) { generation in
                    GenerationItem(generation: generation) { selectedGeneration in
                        selectedGenerations.append(selectedGeneration)
                    } whenDeselected: { deselectedGeneration in
                        let index = selectedGenerations.firstIndex(of: deselectedGeneration)!
                        selectedGenerations.remove(at: index)
                    }

                }
            }
        }
        .padding(.horizontal, 40)
        .padding(.bottom, 50)
    }
}

struct Generation_Previews: PreviewProvider {
    static var previews: some View {
        Generation()
    }
}
