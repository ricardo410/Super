// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let character = try? newJSONDecoder().decode(Character.self, from: jsonData)

import Foundation
import ObjectMapper

// MARK: - Character
struct Character: Mappable {
    
    var id: Int?
    var name, slug: String?
    var powerstats: Powerstats?
    var appearance: Appearance?
    var biography: Biography?
    var work: Work?
    var connections: Connections?
    var images: Images?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        slug        <- map["slug"]
        powerstats  <- map["powerstats"]
        appearance  <- map["appearance"]
        biography   <- map["biography"]
        work        <- map["work"]
        connections <- map["connections"]
        images      <- map["images"]
        
    }
    
    
}

// MARK: - Powerstats
struct Powerstats: Mappable {
    
    var intelligence, strength, speed, durability: Int?
    var power, combat: Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        intelligence <- map["intelligence"]
        strength     <- map["strength"]
        speed        <- map["speed"]
        durability   <- map["durability"]
        power        <- map["power"]
        combat       <- map["combat"]
        
    }
    
    
}


// MARK: - Appearance
struct Appearance: Mappable {
    
    var gender, race: String?
    var height, weight: [String]?
    var eyeColor, hairColor: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        gender      <- map["gender"]
        race        <- map["race"]
        height      <- map["height"]
        weight      <- map["weight"]
        eyeColor    <- map["eyeColor"]
        hairColor   <- map["hairColor"]
    }
    
    
}

// MARK: - Biography
struct Biography: Mappable {
    
    var fullName, alterEgos: String?
    var aliases: [String]?
    var placeOfBirth, firstAppearance, publisher, alignment: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        fullName         <- map["fullName"]
        alterEgos        <- map["alterEgos"]
        aliases          <- map["aliases"]
        placeOfBirth     <- map["placeOfBirth"]
        firstAppearance  <- map["firstAppearance"]
        publisher        <- map["publisher"]
        alignment        <- map["alignment"]
        
    }
    
    
}

// MARK: - Work
struct Work: Mappable {
    
    var occupation, base: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        occupation  <- map["occupation"]
        base        <- map["base"]
    }
    
    
}

// MARK: - Connections
struct Connections: Mappable {
    var groupAffiliation, relatives: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        groupAffiliation <- map["groupAffiliation"]
        relatives        <- map["relatives"]
    }
    
    
}

// MARK: - Images
struct Images: Mappable {
    var xs, sm, md, lg: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        xs  <- map["xs"]
        sm  <- map["sm"]
        md  <- map["md"]
        lg  <- map["lg"]
    }
    
    
}


