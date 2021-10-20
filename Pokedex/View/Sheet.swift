//
//  Sheet.swift
//  Pokedex
//
//  Created by Ramon Almeida on 19/10/21.
//

import SwiftUI

enum SheetMode: Equatable {
    case none
    case half
    case full
}

struct Sheet<Content: View>: View {
    @State var mode: SheetMode = .half
    @Binding var isShowing: Bool
    
    let content: () -> Content
    
    init(isShowing: Binding<Bool>, @ViewBuilder content: @escaping ()->Content) {
        self._isShowing = isShowing
        self.content = content
    }
    
    var xOffset: CGFloat {
        switch self.mode {
        case .none:
            return UIScreen.main.bounds.height
        case .half:
            return UIScreen.main.bounds.height * 0.5
        case .full:
            return .zero
        }
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { value in
                let dy = value.predictedEndLocation.y - value.startLocation.y
                if dy > 0 {
                    self.downMode()
                } else if dy < 0 {
                    self.upMode()
                }
            }
    }
    
    func upMode() {
        switch self.mode {
        case .none:
            self.mode = .half
        default:
            self.mode =  .full
        }
    }
    
    func downMode() {
        switch self.mode {
        case .full:
            self.mode = .half
        default:
            self.mode = .none
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isShowing = false
                        }
                    }
                content()
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .offset(x: 0, y: xOffset)
                    .animation(.spring(), value: mode)
                    .gesture(drag)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
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
