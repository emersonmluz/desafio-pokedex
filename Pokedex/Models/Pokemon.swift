//
//  Pokemon.swift
//  Pokedex
//
//  Created by Émerson M Luz on 18/11/22.
//

import Foundation

struct Pokemon: Codable {
    var id: Int
    var name: NameInLanguages
    var type: [String]
    var base: Base
}
