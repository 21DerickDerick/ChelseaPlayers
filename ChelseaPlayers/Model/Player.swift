//
//  Player.swift
//  ChelseaPlayers
//
//  Created by Derick Derick on 19/12/2017.
//  Copyright © 2017 indiemax. All rights reserved.
//

import Foundation
import UIKit

struct Player {
    let firstName: String
    let lastName: String
    let nationality: String
    let age : String
    let role: String
    let number: String
    let image: UIImage?
    var favorite: Bool
}

extension Player {
    
    struct Key {
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let nationality = "nationality"
        static let age = "age"
        static let role = "role"
        static let number = "number"
        static let image = "imageName"
    }
    
    init?(dictionary: [String: String]) {
        guard let firstNameString = dictionary[Key.firstName],
        let lastNameString = dictionary[Key.lastName],
        let nationalityString = dictionary[Key.nationality],
        let ageString = dictionary[Key.age],
        let roleString = dictionary[Key.role],
        let numberString = dictionary[Key.number] else { return nil }
        
        self.firstName = firstNameString
        self.lastName = lastNameString
        self.nationality = nationalityString
        self.age = ageString
        self.role = roleString
        self.number = numberString
        
        if let imageName = dictionary[Key.image] {
            self.image = UIImage(named: imageName)
        } else {
            image = nil
        }
        
        favorite = false
    }
}
