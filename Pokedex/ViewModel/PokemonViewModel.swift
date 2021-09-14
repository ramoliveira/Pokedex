//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Ramon Dias on 15/09/21.
//

import SwiftUI
import Combine

class PokemonViewModel: ObservableObject, Identifiable {
    @Published var pokemon: Pokemon = Pokemon()
    @Published var pokemons: [Pokemon] = []
    
    private let service: PokemonServicing
    private var cancellables: Set<AnyCancellable>
    
    init(service: PokemonServicing) {
        self.service = service
        cancellables = Set<AnyCancellable>()
    }
    
    func fetchPokemon(byId id: Int) {
        service.fetchPokemon(byId: id)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .failure:
                    self?.pokemon = Pokemon()
                case .finished:
                    break
                }
            } receiveValue: { [weak self] pokemon in
                self?.pokemon = pokemon
            }.store(in: &cancellables)
    }
    
    func fetchPokemons(fromId startId: Int, toId finalId: Int) {
        do {
            try service.fetchPokemons(startId: startId, finalId: finalId)
                    .receive(on: DispatchQueue.main)
                    .sink { [weak self] completion in
                        switch completion {
                        case .failure:
                            self?.pokemon = Pokemon()
                        case .finished:
                            break
                        }
                    } receiveValue: { [weak self] pokemons in
                        self?.pokemons = pokemons.sorted(by: { return $0.id < $1.id })
                    }.store(in: &cancellables)
        } catch {
            self.pokemons = []
        }
    }
}
