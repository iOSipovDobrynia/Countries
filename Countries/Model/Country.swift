//
//  Country.swift
//  Countries
//
//  Created by Goodwasp on 18.09.2023.
//

import Foundation

struct Country {
    let name: Name
    let flags: Flags
    
    init(name: Name, flags: Flags) {
        self.name = name
        self.flags = flags
    }
    
    init(from json: [String: Any]) {
        let flagsJSON = json["flags"] as? [String: String] ?? [:]
        let nameJSON = json["name"] as? [String: String] ?? [:]
        let name = Name(common: nameJSON["common"] ?? "")
        let flags = Flags(png: flagsJSON["png"] ?? "")
        
        self.name = name
        self.flags = flags
    }
    
    
    static func getContries(from value: Any?) -> [Country] {
        guard let value = value as? [[String: Any]] else { return [] }
        return value.map { Country(from: $0)}
    }
}

struct Name {
    let common: String
}

struct Flags {
    let png: String
}
