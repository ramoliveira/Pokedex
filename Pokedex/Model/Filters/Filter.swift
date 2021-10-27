//
//  Filter.swift
//  Pokedex
//
//  Created by Ramon Almeida on 21/10/21.
//

import Foundation

public protocol Filter: ObservableObject {
    associatedtype Arg
    
    var args: [Arg] { get set }
    var isOn: Bool { get }
    
    init(args: [Arg])
    
    func apply(pokemons: [Pokemon]) -> [Pokemon]
    func toggle(_ arg: Arg)
    func reset()
}

public extension Filter {
    var isOn: Bool {
        return !args.isEmpty
    }
    
    func toggle(_ arg: Arg) where Arg: Equatable {
        if args.contains(arg) {
            guard let index = args.firstIndex(of: arg) else { return }
            args.remove(at: index)
        } else {
            args.append(arg)
        }
    }
    
    func reset() {
        args.removeAll()
    }
}
