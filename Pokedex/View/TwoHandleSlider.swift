//
//  TwoHandleSlider.swift
//  Pokedex
//
//  Created by Ramon Almeida on 12/10/21.
//

import SwiftUI

struct TwoHandleSlider: View {
    var body: some View {
        
        
        ZStack(alignment: .center) {
            Capsule()
                .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95))
                .frame(height: 8)
            Capsule()
                .foregroundColor(Color(red: 0.92, green: 0.36, blue: 0.38))
                .frame(height: 8)
                .frame(maxWidth: 52) // Here
            HStack(spacing: 10) { // Here
                VStack {
                    Circle()
                        .strokeBorder(Color(red: 0.92, green: 0.36, blue: 0.38), lineWidth: 4)
                        .background(Color.white)
                        .frame(width: 20, height: 20)
                    Text("200")
                        .font(Style.Font.medium.font(12)).foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.46))
                }.offset(x: 0, y: 10)
                VStack {
                    Circle()
                        .strokeBorder(Color(red: 0.92, green: 0.36, blue: 0.38), lineWidth: 4)
                        .background(Color.white)
                        .frame(width: 20, height: 20)
                    Text("200")
                        .font(Style.Font.medium.font(12)).foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.46))
                }.offset(x: 0, y: 10)
            }
        }
    }
}

struct TwoHandleSlider_Previews: PreviewProvider {
    static var previews: some View {
        TwoHandleSlider()
    }
}
