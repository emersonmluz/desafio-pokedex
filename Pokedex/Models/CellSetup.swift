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
    
    func importPokemonBase (_ base: Pokemon, _ index: IndexPath) {
        pokemonImageView.image = UIImage(named: String(format: "%03d", index.row + 1))
        pokemonNameLabel.text = base.name.english
        pokemonTypePrimaryLabel.text = base.type[0]
        if base.type.count == 2 {
            pokemonTypeSecondaryLabel.text = base.type[1]
        } else {
            pokemonTypeSecondaryLabel.isHidden = true
        }
       
    }
    
}
