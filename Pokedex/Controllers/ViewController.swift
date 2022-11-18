//
//  ViewController.swift
//  Pokedex
//
//  Created by Julia Eileen Schäfer on 18/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var pokedex: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokedex = JsonFileRead.read()
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedex.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellSetup
        
        cell.importPokemonBase(pokedex[indexPath.row], indexPath)
        
        return cell
    }
    
    
}
