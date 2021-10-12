//
//  FilterView.swift
//  Pokedex
//
//  Created by Ramon Almeida on 11/10/21.
//

import SwiftUI

struct FilterView: View {
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
                                print(type)
                            } label: {
                                Image("Type-\(type)", bundle: .main)
                                    .foregroundColor(Style.Color.Pokemon.type(type))
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .padding(.horizontal, 5)
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
                                print(type)
                            } label: {
                                Image("Type-\(type)", bundle: .main)
                                    .foregroundColor(Style.Color.Pokemon.type(type))
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .padding(.horizontal, 5)
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
                        Button {
                            print("short")
                        } label: {
                            Image("Short", bundle: .main)
                                .foregroundColor(Color(red: 1, green: 0.77, blue: 0.90))
                                .frame(width: 50, height: 50, alignment: .center)
                                .padding(.horizontal, 5)
                        }
                        Button {
                            print("medium")
                        } label: {
                            Image("Medium", bundle: .main)
                                .foregroundColor(Color(red: 0.68, green: 0.75, blue: 0.84))
                                .frame(width: 50, height: 50, alignment: .center)
                                .padding(.horizontal, 5)
                        }
                        Button {
                            print("tall")
                        } label: {
                            Image("Tall", bundle: .main)
                                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.72))
                                .frame(width: 50, height: 50, alignment: .center)
                                .padding(.horizontal, 5)
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
                        Button {
                            print("light")
                        } label: {
                            Image("Light", bundle: .main)
                                .foregroundColor(Color(red: 0.6, green: 0.8, blue: 0.49))
                                .frame(width: 50, height: 50, alignment: .center)
                                .padding(.horizontal, 5)
                        }
                        Button {
                            print("normal")
                        } label: {
                            Image("Normal", bundle: .main)
                                .foregroundColor(Color(red: 0.34, green: 0.7, blue: 0.86))
                                .frame(width: 50, height: 50, alignment: .center)
                                .padding(.horizontal, 5)
                        }
                        Button {
                            print("heavy")
                        } label: {
                            Image("Heavy", bundle: .main)
                                .foregroundColor(Color(red: 0.35, green: 0.57, blue: 0.65))
                                .frame(width: 50, height: 50, alignment: .center)
                                .padding(.horizontal, 5)
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
                
//                ZStack(alignment: .center) {
//                    Capsule()
//                        .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95))
//                        .frame(height: 8)
//                    Capsule()
//                        .foregroundColor(Color(red: 0.92, green: 0.36, blue: 0.38))
//                        .frame(height: 8)
//                        .frame(maxWidth: 52) // Here
//                    HStack(spacing: 10) { // Here
//                        VStack {
//                            Circle()
//                                .strokeBorder(Color(red: 0.92, green: 0.36, blue: 0.38), lineWidth: 4)
//                                .background(Color.white)
//                                .frame(width: 20, height: 20)
//                            Text("200")
//                                .font(Style.Font.medium.font(12)).foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.46))
//                        }.offset(x: 0, y: 10)
//                        VStack {
//                            Circle()
//                                .strokeBorder(Color(red: 0.92, green: 0.36, blue: 0.38), lineWidth: 4)
//                                .background(Color.white)
//                                .frame(width: 20, height: 20)
//                            Text("200")
//                                .font(Style.Font.medium.font(12)).foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.46))
//                        }.offset(x: 0, y: 10)
//                    }
//                }
            }
            
            //MARK: - Buttons
            Group {
                HStack(alignment: .center, spacing: 14)  {
                    Button {
                        print("Reset")
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
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
