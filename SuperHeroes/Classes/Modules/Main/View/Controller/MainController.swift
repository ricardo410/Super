//
//  ViewController.swift
//  SuperHeroes
//
//  Created by WILLIAM.ARDILA on 3/02/21.
//

import UIKit

class MainController: UIViewController {
    
    static func PostViewController() -> CharacterController {
        let storyBoardPublication: UIStoryboard = UIStoryboard(name:"Character", bundle: nil)
        let postController = storyBoardPublication.instantiateViewController(withIdentifier: "CharacterController") as! CharacterController
        return postController
    }

    @IBAction func Burron(_ sender: Any) {
        let postController = MainController.PostViewController()
        self.navigationController?.pushViewController(postController, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

