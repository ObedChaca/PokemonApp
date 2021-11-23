import Foundation

struct Pokemon: Codable {
    let url: String
    let name: String
}

struct PokemonList: Codable {
    let count: Int
    let results: [Pokemon]
}
