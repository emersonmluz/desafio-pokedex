//
//  CellSetup.swift
//  Pokedex
//
//  Created by Émerson M Luz on 18/11/22.
//

import Foundation
import UIKit

class CellSetup: UITableViewCell {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    @IBOutlet weak var pokemonTypePrimaryLabel: UILabel!
    
    @IBOutlet weak var pokemonTypeSecondaryLabel: UILabel!
    
    @IBOutlet weak var cellContentView: UIView!
    
    func importPokemonBase (pokemonBase pokemon: Pokemon, toLine index: IndexPath) {
        
        cellContentView.layer.cornerRadius = 5
        pokemonTypePrimaryLabel.layer.cornerRadius = 5
        pokemonTypeSecondaryLabel.layer.cornerRadius = 5
        pokemonTypePrimaryLabel.layer.masksToBounds = true
        pokemonTypeSecondaryLabel.layer.masksToBounds = true
        
        pokemonImageView.image = UIImage(named: String(format: "%03d", index.row + 1))
        pokemonNameLabel.text = pokemon.name.english
        
        pokemonTypePrimaryLabel.text = pokemon.type[0]
        pokemonTypePrimaryLabel.backgroundColor = UIColor(named: pokemon.type[0].lowercased())
        
        if pokemon.type.count == 2 {
            pokemonTypeSecondaryLabel.text = pokemon.type[1]
            pokemonTypeSecondaryLabel.backgroundColor = UIColor(named: pokemon.type[1].lowercased())
            pokemonTypeSecondaryLabel.isHidden = false
        } else {
            pokemonTypeSecondaryLabel.isHidden = true
        }
       
    }
    
}
