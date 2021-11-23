import UIKit

class HomeViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    var viewPokeModel = ViewModelPokemonList()
    //var viewPokeSelModel = ViewModelPokemonSelected()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func setUp(){
        tableView.delegate = self
        tableView.dataSource = self
        viewPokeModel.getListPokemon()
    }
    
    @IBAction func btnLogOut(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewPokeModel.dataArrayPokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewPokeModel.dataArrayPokemonList[indexPath.row].name
        return cell
    }
    
}
