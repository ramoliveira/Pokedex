//
//  Modal.swift
//  Pokedex
//
//  Created by Ramon Almeida on 10/10/21.
//

import SwiftUI

struct Modal<Content: View>: View {
    @Binding var isShowing: Bool
    
    @State private var isDragging: Bool = false
    
    @State private var currentHeight: CGFloat = 400
    let minHeight: CGFloat = 414
    let maxHeight: CGFloat = 800
    
    var content: () -> Content
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                
                VStack {
                    Capsule()
                        .frame(width: 80, height: 6, alignment: .center)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.clear)
                    
                    self.content()
                        .frame(height: currentHeight)
                        .frame(maxWidth: .infinity)
                        .background(
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(30, corners: [.topLeft, .topRight])
                        )
                }
                .gesture(dragGesture)
                .frame(maxWidth: .infinity)
                .animation(isDragging ? nil : .easeInOut(duration: 0.45))
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    
    @State private var prevDragTranslation = CGSize.zero
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { value in
                if !isDragging {
                    isDragging = true
                }
                
                let dragAmmount = value.translation.height - prevDragTranslation.height
                if currentHeight > maxHeight || currentHeight < minHeight {
                    currentHeight -= dragAmmount / 6
                } else {
                    currentHeight -= dragAmmount
                }
                prevDragTranslation = value.translation
            }
            .onEnded { value in
                prevDragTranslation = .zero
                isDragging = false
                if currentHeight > maxHeight {
                    currentHeight = maxHeight
                } else if currentHeight < minHeight {
                    isShowing = false
                }
            }
    }
}

struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
