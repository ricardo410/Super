//
//  CharacterInteractor.swift
//  SuperHeroes
//
//  Created by WILLIAM.ARDILA on 3/02/21.
//

import Foundation
import Alamofire
import ObjectMapper

class CharacterInteractor : PresenterToInteractorCharacterProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterCharacterProtocol?
    var character: [Character]?
    
    
    // MARK: Public Func
    func loadCharacters() {
        print("El Interactor recibe la solicitud del Presentador para cargar los personajes desde el servidor")
       /* CharacterRepository.shared.getCharacters { (character) in
            self.character = character
            self.presenter?.fetchCharactersSuccess(characters: self.character!)
        }*/
        let  url = "https://akabab.github.io/superhero-api/api/all.json"
        AF.request(url).responseJSON{ response  in
            switch response.result {
            case.success:
                
                let characterData = response.value as! NSArray
               

        
                let characterMap = Mapper<Character>().mapArray(JSONObject: characterData)
                //completionHandler(characterMap!)
                self.presenter?.fetchCharactersSuccess(characters:characterMap!)
            case.failure:
                break
            }
        }
        
    }
    
    func retrieveCharacter(at index: Int) {
        self.presenter?.getCharacterSuccess(self.character![index])
    }
    
    
}
