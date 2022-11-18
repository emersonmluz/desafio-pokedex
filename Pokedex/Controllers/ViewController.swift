//
//  ViewController.swift
//  Pokedex
//
//  Created by Julia Eileen Schäfer on 18/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let path = Bundle.main.url(forResource: "pokedex", withExtension: "json")
            let jsonFile = try Data(contentsOf: path!)
            
            let decoder = JSONDecoder()
            let pokedex = try decoder.decode([Pokemon].self, from: jsonFile)
            
            for pokemon in pokedex {
                print (pokemon)
            }
        } catch {
            print ("Error")
        }
        
        // Do any additional setup after loading the view.
    }


}

