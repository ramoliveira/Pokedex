//
//  Array+Unique.swift
//  Pokedex
//
//  Created by Ramon Almeida on 19/09/21.
//

import Foundation

extension Array where Element: Equatable {
    var unique: [Element] {
        var unique: [Element] = []
        forEach { item in
            guard !unique.contains(item) else { return }
            unique.append(item)
        }
        return unique
    }
}
