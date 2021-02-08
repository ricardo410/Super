//
//  CharacterRepository.swift
//  SuperHeroes
//
//  Created by WILLIAM.ARDILA on 3/02/21.
//

import Foundation
import Alamofire
import ObjectMapper

class CharacterRepository {
    
    static let shared = { CharacterRepository() }()
    
    func getCharacters(completionHandler: @escaping (_ data: [Character] ) -> Void ){
       let  url = "https://akabab.github.io/superhero-api/api/all.json"
        
        AF.request(url).responseJSON{ response  in
            switch response.result {
            case.success:
                
                let characterData = response.value as! NSArray
               

        
                let characterMap = Mapper<Character>().mapArray(JSONObject: characterData)
                completionHandler(characterMap!)
            case.failure:
                break
            }
        }
    }
    
}

