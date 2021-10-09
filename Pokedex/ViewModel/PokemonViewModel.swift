//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Ramon Dias on 15/09/21.
//

import SwiftUI
import Combine

class PokemonViewModel: ObservableObject {
    @Published var pokemon: String = ""
    @Published var dataSource: [Pokemon] = []
    
    fileprivate var service: PokemonServicing
    fileprivate var cancellables: Set<AnyCancellable>
    
    init(service: PokemonServicing) {
        self.service = service
        cancellables = Set<AnyCancellable>()
        setupBinding()
    }
    
    func setupBinding() {
        let scheduler = DispatchQueue(label: "PokemonViewModel")
        $pokemon
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .compactMap({ $0.trimmingCharacters(in: .whitespaces) })
            .sink(receiveValue: { pokemonName in
                if pokemonName.isEmpty {
                    self.fetchPokemons(fromId: 1, toId: 10)
                } else {
                    self.fetchPokemon(byName: pokemonName)
                }
            })
            .store(in: &cancellables)
    }
    
    func fetchPokemon(byId id: Int) {
        service.fetchPokemon(byId: id)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .failure:
                    self?.dataSource = []
                case .finished:
                    break
                }
            } receiveValue: { [weak self] pokemon in
                self?.dataSource.removeAll()
                self?.dataSource.append(pokemon)
            }.store(in: &cancellables)
    }
    
    func fetchPokemon(byName name: String) {
        service.fetchPokemon(byName: name.lowercased())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .failure:
                    self?.dataSource = []
                case .finished:
                    break
                }
            } receiveValue: { [weak self] pokemon in
                self?.dataSource.removeAll()
                self?.dataSource.append(pokemon)
            }.store(in: &cancellables)
    }
    
    func fetchPokemons(fromId startId: Int, toId finalId: Int) {
        do {
            try service.fetchPokemons(startId: startId, finalId: finalId)
                    .receive(on: DispatchQueue.main)
                    .sink { [weak self] completion in
                        switch completion {
                        case .failure:
                            self?.dataSource = []
                        case .finished:
                            break
                        }
                    } receiveValue: { [weak self] pokemons in
                        self?.dataSource = pokemons.sorted(by: { return $0.id < $1.id })
                    }.store(in: &cancellables)
        } catch {
            self.dataSource = []
        }
    }
}
