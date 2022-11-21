//
//  DetailsViewController.swift
//  Pokedex
//
//  Created by Émerson M Luz on 20/11/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottonView: UIView!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonTypePrimaryLabel: UILabel!
    @IBOutlet weak var pokemonTypeSecondaryLabel: UILabel!
    
    var pokemon: Pokemon?
    var pokemonImageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        topView.backgroundColor = UIColor(named: pokemon?.type[0].lowercased() ?? "white")
        
        pokemonTypePrimaryLabel.layer.cornerRadius = 5
        pokemonTypeSecondaryLabel.layer.cornerRadius = 5
        pokemonTypePrimaryLabel.layer.masksToBounds = true
        pokemonTypeSecondaryLabel.layer.masksToBounds = true
        
        pokemonNameLabel.text = pokemon?.name.english
        pokemonImageView.image = UIImage(named: pokemonImageName ?? "")
        
        pokemonTypePrimaryLabel.text = pokemon?.type[0]
        pokemonTypePrimaryLabel.backgroundColor = UIColor(named: pokemon?.type[0].lowercased() ?? "")
        
        if pokemon?.type.count == 2 {
            pokemonTypeSecondaryLabel.text = pokemon?.type[1]
            pokemonTypeSecondaryLabel.backgroundColor = UIColor(named: pokemon?.type[1].lowercased() ?? "")
            pokemonTypeSecondaryLabel.isHidden = false
        } else {
            pokemonTypeSecondaryLabel.isHidden = true
        }
    }

}
