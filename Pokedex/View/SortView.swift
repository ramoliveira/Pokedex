//
//  SortView.swift
//  Pokedex
//
//  Created by Ramon Almeida on 20/10/21.
//

import SwiftUI

struct SortView: View {
    enum Options: String {
        case smallestNumber = "Smallest number first"
        case highestNumber = "Highest number first"
        case aToZ = "A-Z"
        case zToA = "Z-A"
    }
    
    let allOptions: [Options] = [
        Options.smallestNumber,
        Options.highestNumber,
        Options.aToZ,
        Options.zToA
    ]
    
    @State var selectedOption: Options = .smallestNumber
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("Sort")
                    .font(Style.Font.bold.font(26))
                    .padding(.bottom, 5)
                    .padding(.top, 30)
                Text("Sort Pokémons alphabetically or by National Pokédex number!")
                    .font(Style.Font.regular.font(16))
                    .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.46))
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 35)
            }
            
            ForEach(allOptions, id: \.self) { option in
                Button {
                    selectedOption = option
                } label: {
                    ZStack {
                        if selectedOption == option {
                            Color(red: 0.917, green: 0.364, blue: 0.376)
                            Text(option.rawValue)
                                .font(Style.Font.regular.font(16))
                                .padding(.vertical, 20)
                                .foregroundColor(.white)
                        } else {
                            Color(red: 0.949, green: 0.949, blue: 0.949)
                            Text(option.rawValue)
                                .font(Style.Font.regular.font(16))
                                .foregroundColor(Color(red: 0.454, green: 0.454, blue: 0.462))
                                .padding(.vertical, 20)
                        }
                    }
                    .cornerRadius(10)
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                }
                .padding(.bottom, 20)
            }
        }
        .padding(.horizontal, 40)
        .padding(.bottom, 50)
    }
}

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView()
    }
}
