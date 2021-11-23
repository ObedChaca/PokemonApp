import Foundation

class ViewModelPokemonList {
    
    var refreshData = {
        () -> () in
    }
    
    var dataArrayPokemonList: [Pokemon] = [] {
        didSet {
            refreshData()
        }
    }
    
    func getListPokemon() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=50") else { return }
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard let data = data else { return }
            do {
                let resultApi = try JSONDecoder().decode(PokemonList.self, from: data)
                for pokemon in resultApi.results {
                    self.dataArrayPokemonList.append(pokemon)
                    print(pokemon)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
}
