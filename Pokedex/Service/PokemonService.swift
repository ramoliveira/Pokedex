//
//  PokemonService.swift
//  Pokedex
//
//  Created by Ramon Dias on 13/09/21.
//

import SwiftUI
import Combine

public protocol PokemonServicing {
    func fetchImage(inUrl url: URL) -> AnyPublisher<Image, Error>
    func fetchPokemon(byId id: Int) -> AnyPublisher<Pokemon, Error>
    func fetchPokemon(byName name: String) -> AnyPublisher<Pokemon, Error>
    func fetchPokemons(startId: Int, finalId: Int) throws -> AnyPublisher<[Pokemon], Error>
    func fetchPokemonResource(byId id: Int) -> AnyPublisher<PokemonResource, Error>
    func fetchPokemonResource(byName name: String) -> AnyPublisher<PokemonResource, Error>
    func fetchPokemonsResources(startId: Int, finalId: Int) throws -> AnyPublisher<[PokemonResource], Error>
}

public struct PokemonService: PokemonServicing {
    enum PokemonServiceError: Swift.Error {
        case invalidRange
        case invalidURL
        case unknowed
    }
    
    public init() {}
    
    public func fetchImage(inUrl url: URL) -> AnyPublisher<Image, Error> {
        return Network(url).requestImage()
    }
    
    // MARK: - Fetch Pokemon Resource -
    public func fetchPokemonResource(byId id: Int) -> AnyPublisher<PokemonResource, Error> {
         return Network(Endpoints.pokemonById(id: id).url).request(PokemonResource.self)
    }
    
    public func fetchPokemonResource(byName name: String) -> AnyPublisher<PokemonResource, Error> {
        return Network(Endpoints.pokemonByName(name: name).url).request(PokemonResource.self)
    }
    
    public func fetchPokemonsResources(startId: Int, finalId: Int) throws -> AnyPublisher<[PokemonResource], Error> {
        guard startId < finalId else { throw PokemonServiceError.invalidRange }
        let ids = (startId...finalId).map { return $0 }
        return Publishers.MergeMany(ids.map(fetchPokemonResource(byId:)))
            .collect()
            .eraseToAnyPublisher()
    }
    
    // MARK: - Fetch Pokemon -
    public func fetchPokemon(byName name: String) -> AnyPublisher<Pokemon, Error> {
        return Network(Endpoints.pokemonByName(name: name).url).request(PokemonResource.self)
            .flatMap { resource -> AnyPublisher<Pokemon, Error> in
                let url = URL(string: resource.sprites?.frontDefault ?? "")!
                return fetchImage(inUrl: url).map { image in
                    let types = resource.types ?? []
                    let stringTypes = types.compactMap { typeResource in
                        return typeResource.type?.name
                    }
                    return Pokemon(
                        id: resource.id ?? 00,
                        name: resource.name ?? "",
                        height: resource.height ?? 0,
                        weight: resource.weight ?? 0,
                        sprite: image,
                        types: stringTypes
                    )
                }.eraseToAnyPublisher()
            }.eraseToAnyPublisher()
    }
    
    public func fetchPokemon(byId id: Int) -> AnyPublisher<Pokemon, Error> {
        return Network(Endpoints.pokemonById(id: id).url).request(PokemonResource.self)
            .flatMap { resource -> AnyPublisher<Pokemon, Error> in
                let url = URL(string: resource.sprites?.frontDefault ?? "")!
                return fetchImage(inUrl: url).map { image in
                    let types = resource.types ?? []
                    let stringTypes = types.compactMap { typeResource in
                        return typeResource.type?.name
                    }
                    return Pokemon(
                        id: resource.id ?? 00,
                        name: resource.name ?? "",
                        height: resource.height ?? 0,
                        weight: resource.weight ?? 0,
                        sprite: image,
                        types: stringTypes
                    )
                }.eraseToAnyPublisher()
            }.eraseToAnyPublisher()
    }
    
    public func fetchPokemons(startId: Int, finalId: Int) throws -> AnyPublisher<[Pokemon], Error> {
        guard startId < finalId else { throw PokemonServiceError.invalidRange }
        let ids = (startId...finalId).map { return $0 }
        return Publishers.MergeMany(ids.map(fetchPokemon(byId:)))
            .collect()
            .eraseToAnyPublisher()
    }
}
