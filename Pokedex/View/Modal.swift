//
//  Modal.swift
//  Pokedex
//
//  Created by Ramon Almeida on 10/10/21.
//

import SwiftUI

struct Modal<Content: View>: View {
    @GestureState private var dragState = DragState.inactive
    @State var position = ModalPosition.top
    
    var content: () -> Content
    
    var body: some View {
        let drag = DragGesture()
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation: drag.translation)
            }.onEnded(dragEnded(_:))
        return self.content()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color.white)
            .cornerRadius(10.0)
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
            .offset(y: self.position.rawValue + self.dragState.translation.height)
            .animation(self.dragState.isDragging ? nil : .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
            .gesture(drag)
    }
    
    private func dragEnded(_ drag: DragGesture.Value) {
        let vDirection = drag.predictedEndLocation.y - drag.location.y
        let modalTopEdgeLocation = self.position.rawValue + drag.translation.height
        let positionAbove: ModalPosition
        let positionBellow: ModalPosition
        let closestPosition: ModalPosition
        
        if modalTopEdgeLocation <= ModalPosition.middle.rawValue {
            positionAbove = .top
            positionBellow = .middle
        } else {
            positionAbove = .middle
            positionBellow = .bottom
        }
        
        if (modalTopEdgeLocation - positionAbove.rawValue) < (positionBellow.rawValue - modalTopEdgeLocation) {
            closestPosition = positionAbove
        } else {
            closestPosition = positionBellow
        }
        
        if vDirection > 0 {
            self.position = positionBellow
        } else if vDirection < 0 {
            self.position = positionAbove
        } else {
            self.position = closestPosition
        }
    }
}

enum ModalPosition: CGFloat {
    case top = 100
    case middle = 500
    case bottom = 850
}

fileprivate enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}

struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        Modal {
            VStack {
                Text("Testing modal")
            }
        }
    }
}
