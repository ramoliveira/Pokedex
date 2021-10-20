//
//  TwoHandleSlider.swift
//  Pokedex
//
//  Created by Ramon Almeida on 12/10/21.
//

import SwiftUI

struct TwoHandleSlider: View {
    @State private var percentage1: Float = 20
    @State private var percentage2: Float = 80
    
//    @Binding var value1: Float
//    @Binding var value2: Float
//    var range: ClosedRange<Float>
//
//    init(value1: Binding<Float>, value2: Binding<Float>, range: ClosedRange<Float>) {
//        self.$value1 = value1
//        self.$value2 = value2
//        self.value1 = value1.wrappedValue
//        self.value2 = value2.wrappedValue
//        self.range = range
//        self.percentage1 = value1.wrappedValue * 100 / range.upperBound
//        self.percentage2 = value2.wrappedValue * 100 / range.upperBound
//    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {
                bar(isBackgroundBar: true)
                HStack(alignment: .center, spacing: 0) {
                    circle(percent: percentage1)
                        .padding(.leading, leadingPadding(proxy))
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                        .onChanged { value in
                            self.percentage1 = min(Float(value.location.x / proxy.size.width * 100), self.percentage2 - 30)
                                        }
                        )
                    bar()
                        .frame(maxWidth: proxy.size.width * 0.8)
                    circle(percent: percentage2)
                        .padding(.trailing, trailingPadding(proxy))
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                        .onChanged { value in
                            self.percentage2 = max(Float(value.location.x / proxy.size.width * 100), self.percentage1 + 30)
                                        }
                        )
                }
            }
        }
    }
    
    private func circle(percent: Float) -> some View {
        VStack(alignment: .center, spacing: 0) {
            Circle()
                .strokeBorder(Color(red: 0.92, green: 0.36, blue: 0.38), lineWidth: 4)
                .background(Color.white)
                .frame(width: 20, height: 20)
                .cornerRadius(10)
            Text(String(format: "%2.0f", percent))
                .frame(width: 30, alignment: .center)
                .frame(minWidth: 20, maxWidth: 30)
                .font(Style.Font.medium.font(12))
                .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.46))
                .padding(5)
        }
        .offset(x: 0, y: 12)
        .zIndex(1)
    }
    
    private func bar(isBackgroundBar: Bool = false) -> some View {
        Capsule()
            .foregroundColor(isBackgroundBar ? Color(red: 0.95, green: 0.95, blue: 0.95) : Color(red: 0.92, green: 0.36, blue: 0.38))
            .frame(height: 8)
            .padding(.horizontal, isBackgroundBar ? 25 : -15)
    }
    
    private var uiPercentage2: Float {
        100 - percentage2
    }
    
    private func leadingPadding(_ proxy: GeometryProxy) -> CGFloat {
        CGFloat(self.percentage1 / 100) * proxy.size.width
    }
    
    private func trailingPadding(_ proxy: GeometryProxy) -> CGFloat {
        CGFloat(uiPercentage2 / 100) * proxy.size.width
    }
}

struct TwoHandleSlider_Previews: PreviewProvider {
    @State static var value1: Float = 20
    @State static var value2: Float = 100
    
    static var previews: some View {
//        TwoHandleSlider(value1: $value1, value2: $value2, range: 1...855)
        TwoHandleSlider()
    }
}
