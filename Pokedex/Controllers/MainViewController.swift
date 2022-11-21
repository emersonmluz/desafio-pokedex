//
//  ViewController.swift
//  Pokedex
//
//  Created by Julia Eileen Schäfer on 18/11/22.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var pokedex: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokedex = JsonFile.read()
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedex.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellSetupController
        
        cell.importPokemonBase(pokemonBase: pokedex[indexPath.row])
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailsScreen = storyboard!.instantiateViewController(withIdentifier: "DetailsView") as! DetailsViewController
        
        detailsScreen.pokemon = pokedex[indexPath.row]
        detailsScreen.pokemonImageName = String(format: "%03d", indexPath.row + 1)
        
        self.navigationController!.pushViewController(detailsScreen, animated: true)
    }
}
