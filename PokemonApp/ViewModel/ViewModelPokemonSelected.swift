import Foundation

class ViewModelPokemonSelected {
    
    var refreshData = {
        () -> () in
    }
    
    
    func getPokemonSelected(url: String) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard let data = data else { return }
            do {
                _ = try JSONDecoder().decode(PokemonSelected.self, from: data)
                
                //Sprites
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
}
