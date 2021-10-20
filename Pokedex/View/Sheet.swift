//
//  Sheet.swift
//  Pokedex
//
//  Created by Ramon Almeida on 19/10/21.
//

import SwiftUI

struct Sheet<Content: View>: View {
    private enum Mode: Equatable {
        case half
        case full
    }
    
    @State private var mode: Mode = .half
    @Binding var isShowing: Bool
    
    let content: () -> Content
    
    init(isShowing: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) {
        self._isShowing = isShowing
        self.content = content
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            self.mode = .half
                            self.isShowing = false
                        }
                    }
                VStack {
                    Capsule()
                        .frame(width: 80, height: 6, alignment: .center)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.clear)
                    content()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                }
                .offset(x: 0, y: xOffset)
                .animation(.spring(), value: mode)
                .transition(.move(edge: .bottom))
                .gesture(drag)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
    
    var xOffset: CGFloat {
        switch self.mode {
        case .half:
            return UIScreen.main.bounds.height * 0.5
        case .full:
            return .zero
        }
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onEnded { value in
                let dy = value.predictedEndLocation.y - value.startLocation.y
                if dy > 0 {
                    self.downMode()
                } else if dy < 0 {
                    self.upMode()
                }
            }
    }
    
    func upMode() {
        withAnimation {
            self.mode = .full
        }
    }
    
    func downMode() {
        withAnimation {
            switch self.mode {
            case .full:
                self.mode = .half
            default:
                self.isShowing = false
            }
        }
    }
}

struct Sheet_Previews: PreviewProvider {
    @State static var isShowing: Bool = true
    
    static var previews: some View {
        Sheet(isShowing: $isShowing) {
            VStack {
                Text("Hello World")
                    .foregroundColor(Color.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
    }
}
