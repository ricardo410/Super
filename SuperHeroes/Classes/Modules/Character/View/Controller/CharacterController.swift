//
//  CharacterController.swift
//  SuperHeroes
//
//  Created by WILLIAM.ARDILA on 3/02/21.
//

import Foundation
import UIKit
import SDWebImage


class CharacterController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var typesSegmentedControl: UISegmentedControl!
    @IBOutlet weak var collection: UICollectionView!
    
    // MARK: - Properties
    var presenter: ViewToPresenterCharacterProtocol?
    var characters = [Character]()
   
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        //collection.delegate = self
        //collection.dataSource = self
        //loadCell()
        
        
      

    }
    
}

extension CharacterController: PresenterToViewCharacterProtocol{
    
    func onFetchCharacterSuccess(character: [Character]) {
        self.characters = character
        
        self.collection.reloadData()
       
    }
    
    func onFetchCharacterFailure(error: String) {
        
    }
    
    func showHUD() {
        
    }
    
    func hideHUD() {
        
    }
    
    func deselectRowAt(row: Int) {
        self.collection.deselectItem(at: IndexPath(row: row, section: 0), animated: true)
    }
    
    
    
}

extension CharacterController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
        //return  characters.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CharacterCell
        
        //let data =  self.characters[indexPath.row]
       // cell.characterNameLb.text = data.name
        //cell.characterImage.sd_setImage(with: URL(string: (data.images?.sm)!), placeholderImage: UIImage(named: "placeholder.png"))
       cell.characterNameLb.text = presenter?.labelText(indexPath: indexPath)
       cell.characterImage.sd_setImage(with: URL(string: (presenter?.setImage(indexPath: indexPath))!), placeholderImage: UIImage(named: "placeholder.png"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.deselectRowAt(index: indexPath.row)
        presenter?.didSelectRowAt(index: indexPath.row)
    }
    
    func loadCell(){
        self.collection.register(UINib.init(nibName: CharacterCell.key, bundle:nil), forCellWithReuseIdentifier: CharacterCell.key)
    }

}


