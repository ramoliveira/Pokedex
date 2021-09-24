//
//  Container.swift
//  Pokedex
//
//  Created by Ramon Dias on 13/09/21.
//

import Foundation

typealias Resolver = Container

class Container {
    var content: [String: Any] = [:]
    
    func register<Object: Any>(_ objectType: Object.Type, object: @escaping (Resolver) -> Object) {
        content[String(describing: Object.self)] = object(self)
    }
    
    func resolve<Object: Any>(_ objectType: Object.Type) -> Object? {
        content[String(describing: Object.self)] as? Object
    }
}

class SContainer: Container {
    static var shared: SContainer = SContainer()
    private override init() {}
}
