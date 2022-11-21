//
//  JsonRead.swift
//  Pokedex
//
//  Created by Émerson M Luz on 18/11/22.
//

import Foundation

class JsonFile {
    static func read () -> [Pokemon] {
        var result: [Pokemon] = []
        
        do {
            let path = Bundle.main.url(forResource: "pokedex", withExtension: "json")
            let jsonFile = try Data(contentsOf: path!)
            
            let decoder = JSONDecoder()
            result = try decoder.decode([Pokemon].self, from: jsonFile)
            
        } catch let error {
            print (error)
        }
        return result
    }
}
