import Foundation

struct PokemonSelected: Codable {
    let name: String
    let sprites: PokemonSprites
}

struct PokemonSprites: Codable {
    var front_default: String
}
