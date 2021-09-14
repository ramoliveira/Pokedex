//
//  Container.swift
//  Pokedex
//
//  Created by Ramon Dias on 13/09/21.
//

import Foundation

protocol Injectable {
    func register<Component: Any>(_ type: Component.Type, component: Component)
    func resolve<Component>(_ type: Component.Type) -> Component?
}

public class Container: Injectable {
    static let shared = Container()
    
    private init() {}
    
    var components: [String:Any] = [:]
    
    func register<Component>(_ type: Component.Type, component: Component) {
        components[String(describing: type)] = component
    }
    
    func resolve<Component>(_ type: Component.Type) -> Component? {
        return components[String(describing: type)] as? Component
    }
}
