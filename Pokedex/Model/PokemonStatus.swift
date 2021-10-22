//
//  PokemonStatus.swift
//  Pokedex
//
//  Created by Ramon Almeida on 21/10/21.
//

import Foundation

struct PokemonStatus {
    let MAX_IV: Double = 31
    let MAX_EV: Double = 252
    let MAX_NATURE: Double = 1.1
    let MIN_IV: Double = 0
    let MIN_EV: Double = 0
    let MIN_NATURE: Double = 0.9
    let LEVEL: Double = 100

    var hp: Double
    var attack: Double
    var defense: Double
    var spAttack: Double
    var spDefense: Double
    var speed: Double
    var defenses: [Defense]

    var total: Double {
        hp + attack + defense + spAttack + spDefense + speed
    }

    var maxHp: Double {
        calculateHp()
    }

    var minHp: Double {
        calculateHp(isMax: false)
    }

    var maxAttack: Double {
        calculateOtherStat(base: attack)
    }

    var minAttack: Double {
        calculateOtherStat(isMax: false, base: attack)
    }

    var maxDefense: Double {
        calculateOtherStat(base: defense)
    }

    var minDefense: Double {
        calculateOtherStat(isMax: false, base: defense)
    }

    var maxSpAttack: Double {
        calculateOtherStat(base: spAttack)
    }

    var minSpAttack: Double {
        calculateOtherStat(isMax: false, base: spAttack)
    }

    var maxSpDefense: Double {
        calculateOtherStat(base: spDefense)
    }

    var minSpDefense: Double {
        calculateOtherStat(isMax: false, base: spDefense)
    }

    var maxSpeed: Double {
        calculateOtherStat(base: speed)
    }

    var minSpeed: Double {
        calculateOtherStat(isMax: false, base: speed)
    }

    private func calculateHp(isMax: Bool = true) -> Double {
        if isMax {
            return ((0.01 * (2 * hp + MAX_IV + (0.25 * MAX_EV)) * LEVEL) + LEVEL + 10).rounded(.down)
        }
        return ((0.01 * (2 * hp + MIN_IV + (0.25 * MIN_EV)) * LEVEL) + LEVEL + 10).rounded(.down)
    }

    private func calculateOtherStat(isMax: Bool = true, base: Double) -> Double {
        if isMax {
            return (((0.01 * (2 * base + MAX_IV + (0.25 * MAX_EV)) * LEVEL) + 5) * MAX_NATURE).rounded(.down)
        }
        return (((0.01 * (2 * base + MIN_IV + (0.25 * MIN_EV)) * LEVEL) + 5) * MIN_NATURE).rounded(.down)
    }
}
