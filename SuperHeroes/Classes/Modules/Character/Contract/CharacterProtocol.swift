//
//  CharacterContract.swift
//  SuperHeroes
//
//  Created by WILLIAM.ARDILA on 3/02/21.
//


import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewCharacterProtocol: class {
    
    func onFetchCharacterSuccess(character: [Character])
    func onFetchCharacterFailure(error: String)
    
    func showHUD()
    func hideHUD()
    
    func deselectRowAt(row: Int)
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCharacterProtocol: class {
    
    var view: PresenterToViewCharacterProtocol? { get set }
    var interactor: PresenterToInteractorCharacterProtocol? { get set }
    var router: PresenterToRouterCharacterProtocol? { get set }
    
    var charactersName:  [String]? { get set }
    var charactersImage:  [String]? { get set }
    
    func viewDidLoad()
    
    func refresh()
    
    func numberOfRowsInSection() -> Int
    func labelText(indexPath: IndexPath) -> String?
    func setImage(indexPath: IndexPath) -> String?
    
    
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)

}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCharacterProtocol: class {
    
    var presenter: InteractorToPresenterCharacterProtocol? { get set }
    
    func loadCharacters()
    func retrieveCharacter(at index: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCharacterProtocol: class {
    
    func fetchCharactersSuccess(characters: [Character])
   
    func getCharacterSuccess(_ character: Character)
    func getCharacterFailure()
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCharacterProtocol: class {
    
    static func createModule() -> CharacterController
    
    //func pushToQuoteDetail(on view: PresenterToViewQuotesProtocol, with quote: Quote)
}
