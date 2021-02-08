//
//  CharacterPresenter.swift
//  SuperHeroes
//
//  Created by WILLIAM.ARDILA on 3/02/21.
//

import Foundation


class CharacterPresenter:  ViewToPresenterCharacterProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewCharacterProtocol?
    var interactor: PresenterToInteractorCharacterProtocol?
    var router: PresenterToRouterCharacterProtocol?
    
    var charactersName: [String]?
    var charactersImage: [String]?
    var characters:  [Character]?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        print("Se notifica al presentador que se cargó la vista")
        //view?.showHUD()
        interactor?.loadCharacters()
    }
    
    func refresh() {
        print("Se notifica al presentador que se actualizó la vista")
        interactor?.loadCharacters()
    }
    
    func numberOfRowsInSection() -> Int {
        guard let characters = self.characters else {
            return 0
        }
        return characters.count
    }
    
    func labelText(indexPath: IndexPath) -> String? {
        guard let charactersName = self.charactersName else {
            return nil
        }
        
        return charactersName[indexPath.row]
    }
    
    func setImage(indexPath: IndexPath) -> String? {
        guard let charactersImage = self.charactersImage else {
            return nil
        }
        
        return charactersImage[indexPath.row]
    }
    
    
    func didSelectRowAt(index: Int) {
        interactor?.retrieveCharacter(at: index)
    }
    
    func deselectRowAt(index: Int) {
        interactor?.retrieveCharacter(at: index)
    }
    
    
}

// MARK: - Outputs to view
extension CharacterPresenter: InteractorToPresenterCharacterProtocol{
    
    func fetchCharactersSuccess(characters: [Character]) {
        print ("El presentador recibe el resultado de Interactor después de haber hecho su trabajo")
        self.characters = characters
        self.charactersName = characters.compactMap { $0.name }
        self.charactersImage = characters.compactMap { $0.images?.md }
        
        //view?.hideHUD()
        view?.onFetchCharacterSuccess(character: self.characters!)
        
    }
    
    func getCharacterSuccess(_ character: Character) {
        //router?.pushToQuoteDetail(on: view!, with: quote)
    }
    
    func fetchCharacterFailure(errorCode: Int) {
        print ("El presentador recibe el resultado de Interactor después de haber hecho su trabajo")
    }
    
    func getCharacterFailure() {
        //view?.hideHUD()
        print ("No se pudo recuperar el personaje por índice")
    }
    
    
}
