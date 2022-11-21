//
//  DetailsViewController.swift
//  Pokedex
//
//  Created by Émerson M Luz on 20/11/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var TopView: UIView!
    @IBOutlet weak var BottonView: UIView!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    var pokemon: Pokemon?
    var pokemonImageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        TopView.backgroundColor = UIColor(named: pokemon?.type[0].lowercased() ?? "white")
        
        pokemonImageView.image = UIImage(named: pokemonImageName ?? "")
    }

}
