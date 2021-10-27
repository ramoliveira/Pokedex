//
//  FilterView.swift
//  Pokedex
//
//  Created by Ramon Almeida on 11/10/21.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject private var typeFilter: TypeFilter
    @EnvironmentObject private var weaknessFilter: WeaknessFilter
    @EnvironmentObject private var heightFilter: HeightFilter
    @EnvironmentObject private var weightFilter: WeightFilter
    @EnvironmentObject private var idFilter: IdFilter
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("Filter")
                    .font(Style.Font.bold.font(26))
                    .padding(.bottom, 5)
                    .padding(.top, 30)
                Text("Use advanced search to explore Pokémon by type, weakness, height and more!")
                    .font(Style.Font.regular.font(16))
                    .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.46))
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 15)
            }
            
            //MARK: - Types
            Group {
                Text("Types")
                    .font(Style.Font.bold.font(16))
                    .padding(.bottom, 10)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(PokemonType.all, id: \.self) { type in
                            Button {
                                typeFilter.toggle(type)
                            } label: {
                                if typeFilter.args.contains(type) {
                                    ZStack {
                                        Circle()
                                            .foregroundColor(Style.Color.Pokemon.type(type))
                                        Image("Type-\(type.rawValue)", bundle: .main)
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .padding(.horizontal, 5)
                                } else {
                                    Image("Type-\(type.rawValue)", bundle: .main)
                                        .foregroundColor(Style.Color.Pokemon.type(type))
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .padding(.horizontal, 5)
                                }
                            }
                        }
                    }
                }.padding(.bottom, 15)
            }
            
            //MARK: - Weaknesses
            Group {
                Text("Weaknesses")
                    .font(Style.Font.bold.font(16))
                    .padding(.bottom, 10)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(PokemonType.all, id: \.self) { type in
                            Button {
                                weaknessFilter.toggle(type)
                            } label: {
                                if weaknessFilter.args.contains(type) {
                                    ZStack {
                                        Circle()
                                            .foregroundColor(Style.Color.Pokemon.type(type))
                                        Image("Type-\(type.rawValue)", bundle: .main)
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .padding(.horizontal, 5)
                                } else {
                                    Image("Type-\(type.rawValue)", bundle: .main)
                                        .foregroundColor(Style.Color.Pokemon.type(type))
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .padding(.horizontal, 5)
                                }
                            }
                        }
                    }
                }.padding(.bottom, 15)
            }
            
            //MARK: - Heights
            Group {
                Text("Heights")
                    .font(Style.Font.bold.font(16))
                    .padding(.bottom, 10)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(HeightType.all, id: \.self) { type in
                            Button {
                                heightFilter.toggle(type)
                            } label: {
                                if heightFilter.args.contains(type) {
                                    ZStack {
                                        Circle()
                                            .foregroundColor(Style.Color.Height.type(type))
                                        Image(type.rawValue, bundle: .main)
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .padding(.horizontal, 5)
                                } else {
                                    Image(type.rawValue, bundle: .main)
                                        .foregroundColor(Style.Color.Height.type(type))
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .padding(.horizontal, 5)
                                }
                            }
                        }
                    }
                }.padding(.bottom, 15)
            }
            
            //MARK: - Weights
            Group {
                Text("Weights")
                    .font(Style.Font.bold.font(16))
                    .padding(.bottom, 10)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(WeightType.all, id: \.self) { type in
                            Button {
                                weightFilter.toggle(type)
                            } label: {
                                if weightFilter.args.contains(type) {
                                    ZStack {
                                        Circle()
                                            .foregroundColor(Style.Color.Weight.type(type))
                                        Image(type.rawValue, bundle: .main)
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .padding(.horizontal, 5)
                                } else {
                                    Image(type.rawValue, bundle: .main)
                                        .foregroundColor(Style.Color.Weight.type(type))
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .padding(.horizontal, 5)
                                }
                            }
                        }
                    }
                }.padding(.bottom, 15)
            }
            
            //MARK: - Number Range
            Group {
                Text("Number Range")
                    .font(Style.Font.bold.font(16))
                    .padding(.bottom, 20)
                
                CustomSlider(percentage: 50)
                    .padding(.bottom, 40)
                
            }
            
            //MARK: - Buttons
            Group {
                HStack(alignment: .center, spacing: 14)  {
                    Button {
                        withAnimation {
                            reset()
                        }
                    } label: {
                        Text("Reset")
                            .font(Style.Font.regular.font(16))
                            .frame(width: 160, height: 60, alignment: .center)
                            .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.46))
                            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                            .cornerRadius(10)
                    }
                    Button {
                        print("Apply")
                    } label: {
                        Text("Apply")
                            .font(Style.Font.regular.font(16))
                            .frame(width: 160, height: 60, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.92, green: 0.36, blue: 0.38))
                            .cornerRadius(10)
                    }
                }
            }
        }.padding(.horizontal, 40)
        .padding(.bottom, 50)
        .background(Color.white)
    }
    
    func reset() {
        typeFilter.reset()
        weaknessFilter.reset()
        heightFilter.reset()
        weightFilter.reset()
        idFilter.reset()
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
