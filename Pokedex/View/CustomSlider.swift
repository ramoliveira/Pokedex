//
//  CustomSlider.swift
//  Pokedex
//
//  Created by Ramon Almeida on 12/10/21.
//

import SwiftUI

struct CustomSlider: View {
    @State var percentage: Float = 50
    
    var body: some View {
        Capsule()
            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95))
            .frame(height: 8)
            .overlay {
                GeometryReader { geometry in
                    HStack(spacing: -10) {
                        Capsule()
                            .foregroundColor(Color(red: 0.92, green: 0.36, blue: 0.38))
                            .frame(width: CGFloat(self.percentage / 100) * geometry.size.width, height: 8)
                        VStack {
                            Circle()
                                .strokeBorder(Color(red: 0.92, green: 0.36, blue: 0.38), lineWidth: 4)
                                .background(Color.white)
                                .frame(width: 20, height: 20)
                                .cornerRadius(10)
                            Text(String(format: "%4.0f", percentage))
                                .font(Style.Font.medium.font(12)).foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.46))
                        }.offset(x: 0, y: 10)
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                    .onChanged { value in
                                self.percentage = min(max(0, Float(value.location.x / geometry.size.width * 100)), 100)
                                    }
                        )
                    }.offset(x: 0, y: -15)
                    .animation(.easeInOut)
                    .transition(.move(edge: .leading))
                }
            }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    @State static var percentage: Float = 50
    
    static var previews: some View {
        CustomSlider(percentage: percentage)
    }
}
