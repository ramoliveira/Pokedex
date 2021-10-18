//
//  TwoHandleSlider.swift
//  Pokedex
//
//  Created by Ramon Almeida on 12/10/21.
//

import SwiftUI

struct TwoHandleSlider: View {
    @State private var percent_1: Float = 20
    @State private var percent_2: Float = 80
    
    func circle(percent: Float) -> some View {
        VStack(alignment: .center, spacing: 0) {
            Circle()
                .frame(width: 20, height: 20)
                .cornerRadius(10)
            Text(String(format: "%3.0f", percent))
                .frame(width: 30)
                .frame(minWidth: 20, maxWidth: 30)
                .foregroundColor(.black).padding(5)
        }
    }
    
    func bar(isBackgroundBar: Bool = false) -> some View {
        Capsule()
            .foregroundColor(isBackgroundBar ? .gray : .red)
            .frame(height: 8)
            .padding(.horizontal, isBackgroundBar ? 25 : -15)
    }
    
    var ui_percent_2: Float {
        100 - percent_2
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {
                bar(isBackgroundBar: true)
                HStack(alignment: .center, spacing: 0) {
                    circle(percent: percent_1)
                        .offset(x: 0, y: 15)
                        .zIndex(1)
                        .padding(.leading, CGFloat(self.percent_1 / 100) * proxy.size.width)
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                        .onChanged { value in
                            self.percent_1 = min(max(0, Float(value.location.x / proxy.size.width * 100)), 100)
                                        }
                            )
                    bar()
                    circle(percent: percent_2)
                        .offset(x: 0, y: 15)
                        .zIndex(1)
                        .padding(.trailing, CGFloat(ui_percent_2 / 100) * proxy.size.width)
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                        .onChanged { value in
                            self.percent_2 = min(max(0, Float(value.location.x / proxy.size.width * 100)), 100)
                                        }
                            )
                }
            }
        }
    }
}

struct TwoHandleSlider_Previews: PreviewProvider {
    static var previews: some View {
        TwoHandleSlider()
    }
}
