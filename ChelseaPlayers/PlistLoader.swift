//
//  PlistLoader.swift
//  ChelseaPlayers
//
//  Created by Derick Derick on 19/12/2017.
//  Copyright © 2017 indiemax. All rights reserved.
//

import Foundation

enum PlistError: Error {
    case invalidResource
    case parsingFailure
}

class PlistLoader {
    
    static func array(fromFile name: String, ofType type: String) throws -> [[String: String]] {

        guard let path = Bundle.main.path(forResource: name, ofType: type) else { throw PlistError.invalidResource}
        
        guard let array = NSArray(contentsOfFile: path) as? [[String: String]] else {
            throw PlistError.parsingFailure
        }
        
        return array
    }

}

class PlayersSource {
    static var players: [Player] {
        let data = try! PlistLoader.array(fromFile: "PlayersDB", ofType: "plist")
        return data.flatMap { Player(dictionary: $0) }
    }
}
