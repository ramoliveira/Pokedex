//
//  IdFilter.swift
//  Pokedex
//
//  Created by Ramon Almeida on 25/10/21.
//

import Foundation

public class IdFilter: Filter {
    public typealias Arg = Int

    @Published public var args: [Int]
    
    required public init(args: [Int]) {
        self.args = args
    }
    
    public init(arg1: Int, arg2: Int) {
        self.args = [arg1, arg2]
    }
    
    public func apply(pokemons: [Pokemon]) -> [Pokemon] {
        let lowerBound = args[0]
        let upperBound = args[1]
        
        return pokemons.filter { pokemon in
            if pokemon.id >= lowerBound && pokemon.id <= upperBound {
                return true
            }
            return false
        }
    }
    
    public func reset() {
        self.args = [1, 10]
    }
}
