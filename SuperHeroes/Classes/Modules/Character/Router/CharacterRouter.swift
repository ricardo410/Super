//
//  CharacterRouter.swift
//  SuperHeroes
//
//  Created by WILLIAM.ARDILA on 3/02/21.
//

import Foundation
import UIKit


class CharacterRouter: PresenterToRouterCharacterProtocol {
    
    static func createModule() -> CharacterController {
        
            // MARK: Static methods
            print("QuotesRouter creates the Quotes module.")
           

           
        let view = mainstoryboard.instantiateViewController(withIdentifier: "CharacterController") as! CharacterController
        
        
        let presenter: ViewToPresenterCharacterProtocol & InteractorToPresenterCharacterProtocol = CharacterPresenter()
        let interactor: PresenterToInteractorCharacterProtocol = CharacterInteractor()
        let router:PresenterToRouterCharacterProtocol = CharacterRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }


          
            
            /*
     let viewController = CharacterController()

            viewController.presenter = presenter
            viewController.presenter?.router = CharacterRouter()
            viewController.presenter?.view = viewController
            viewController.presenter?.interactor = CharacterInteractor()
            viewController.presenter?.interactor?.presenter = presenter
            
            return viewController
        //}*/
    
    
   
    static var mainstoryboard: UIStoryboard{
           return UIStoryboard(name:"Main",bundle: Bundle.main)
       }
    
    
}
