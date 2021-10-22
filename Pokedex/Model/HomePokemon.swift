//
//  HomePokemon.swift
//  Pokedex
//
//  Created by Ramon Almeida on 21/10/21.
//

import Foundation

public struct HomePokemon {
    /*
     HomePokemon should have:
        - Id
        - Name
        - Types
        - Weaknesses
        - Height
        - Weight
     
     To get this, we should do the following fetches:
        https://pokeapi.co/api/v2/pokemon/1
        TypeResource
            - name: String?
            - url: String?
        
        HomePokemonResource
            - id: Int?
            - name: String?
            - types: [TypeResource]?
            - height: Int?
            - weight: Int?
     */
    
    /*
     AboutPokemon should have:
        - Description
        - Specie
        - Height
        - Weight
        - Abilities
        - Weaknesses
        - EV Yield
        - Catch Rate
        - Base Friendship
        - Base Exp
        - Growth Rate
        - Genders
        - Egg Groups
        - Egg Cycles
        - Locations
     */
    
    /*
     StatsPokemon should have:
        - HP
        - Attack
        - Defense
        - Sp. Attack
        - Sp. Defense
        - Speed
        - Type Effectiveness
     */
    
    /*
     EvolutionPokemon should have:
        - Sprites
        - Levels
        - Names
     */
}


