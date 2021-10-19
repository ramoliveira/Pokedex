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
                .strokeBorder(Color(red: 0.92, green: 0.36, blue: 0.38), lineWidth: 4)
                .background(Color.white)
                .frame(width: 20, height: 20)
                .cornerRadius(10)
            Text(String(format: "%4.0f", percent))
                .frame(width: 30, alignment: .center)
                .frame(minWidth: 20, maxWidth: 30)
                .font(Style.Font.medium.font(12))
                .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.46))
                .padding(5)
        }
    }
    
    func bar(isBackgroundBar: Bool = false) -> some View {
        Capsule()
            .foregroundColor(isBackgroundBar ? Color(red: 0.95, green: 0.95, blue: 0.95) : Color(red: 0.92, green: 0.36, blue: 0.38))
            .frame(height: 8)
            .padding(.horizontal, isBackgroundBar ? 25 : -15)
    }
    
    private var uiPercentage2: Float {
        100 - percent_2
    }
    
    private func leadingPadding(_ proxy: GeometryProxy) -> CGFloat {
        CGFloat(self.percent_1 / 100) * proxy.size.width
    }
    
    private func trailingPadding(_ proxy: GeometryProxy) -> CGFloat {
        CGFloat(uiPercentage2 / 100) * proxy.size.width
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {
                bar(isBackgroundBar: true)
                HStack(alignment: .center, spacing: 0) {
                    circle(percent: percent_1)
                        .offset(x: 0, y: 12)
                        .zIndex(1)
                        .padding(.leading, leadingPadding(proxy))
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                        .onChanged { value in
                            self.percent_1 = min(Float(value.location.x / proxy.size.width * 100), self.percent_2 - 30)
                                        }
                            )
                    bar()
                        .frame(maxWidth: proxy.size.width * 0.8)
                    circle(percent: percent_2)
                        .offset(x: 0, y: 12)
                        .zIndex(1)
                        .padding(.trailing, trailingPadding(proxy))
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                        .onChanged { value in
                            self.percent_2 = max(Float(value.location.x / proxy.size.width * 100), self.percent_1 + 30)
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
