//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Émerson M Luz on 12/12/22.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonTypePrimaryLabel: UILabel!
    @IBOutlet weak var pokemonTypeSecondaryLabel: UILabel!
    @IBOutlet weak var cellContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setPokemons(pokemonList: [Pokemon], index: Int) {
        cellContentView.layer.cornerRadius = 5
        pokemonTypePrimaryLabel.layer.cornerRadius = 5
        pokemonTypeSecondaryLabel.layer.cornerRadius = 5
        pokemonTypePrimaryLabel.layer.masksToBounds = true
        pokemonTypeSecondaryLabel.layer.masksToBounds = true
        
        pokemonImageView.image = UIImage(named: String(format: "%03d", pokemonList[index].id))
        pokemonNameLabel.text = pokemonList[index].name.english
        
        pokemonTypePrimaryLabel.text = pokemonList[index].type[0]
        pokemonTypePrimaryLabel.backgroundColor = UIColor(named: pokemonList[index].type[0].lowercased())
        
        if pokemonList[index].type.count == 2 {
            pokemonTypeSecondaryLabel.text = pokemonList[index].type[1]
            pokemonTypeSecondaryLabel.backgroundColor = UIColor(named: pokemonList[index].type[1].lowercased())
            pokemonTypeSecondaryLabel.isHidden = false
        } else {
            pokemonTypeSecondaryLabel.isHidden = true
        }
       
    }
    
}
