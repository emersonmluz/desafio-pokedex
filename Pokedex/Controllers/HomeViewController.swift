//
//  ViewController.swift
//  Pokedex
//
//  Created by Julia Eileen Schäfer on 18/11/22.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var pokedex: [Pokemon] = []
    var soundTheme: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokedex = JsonFile.read()
        soundTheme = AudioFile.importAudioFile()
//        soundTheme?.numberOfLoops = -1
//        soundTheme?.play()
        
        setupPokemonTableView()
//        tableView.dataSource = self
//        tableView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    func setupPokemonTableView() {
        tableView.register(UINib(nibName: "PokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "pokemonCell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedex.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell") as! PokemonTableViewCell
        
        cell.setPokemons(pokemonList: pokedex, index: indexPath.row)
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailsScreen = storyboard!.instantiateViewController(withIdentifier: "DetailsView") as! DetailsViewController
        
        detailsScreen.pokemon = pokedex[indexPath.row]
        detailsScreen.pokemonImageName = String(format: "%03d", indexPath.row + 1)
        
        self.navigationController!.pushViewController(detailsScreen, animated: true)
    }
}
