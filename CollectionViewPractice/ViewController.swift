//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by appinventiv on 30/08/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    var isClicked = true
    var filteredData: [String]!

    @IBAction func tableBtn(_ sender: UIBarButtonItem) {
      
        let signUpScene = self.storyboard?.instantiateViewController(withIdentifier: "table") as! TableViewClassViewController
        signUpScene.nameArr = self.nameArr
        
        self.navigationController?.pushViewController(signUpScene, animated: true)
        
        
    }
   // let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var myImagelarger: UIImageView!
    var nameArr = ["rottwiler", "pug", "bulldog", "boxer", "german", "golden", "lappy1", "lappy2","lappy3","lappy4","lappy5","lappy6","lappy7","lappy8","lappy9","lappy10","lappy11", "lappy12", "lappy13","samsung", "sony", "lumia", "vivo", "mi"]

    

    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    //=====View did Load Method//////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.delegate = self
        searchbar.delegate = self
        filteredData = nameArr
      }
    
    }

    extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return filteredData.count
        }
    
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CellData else {
                fatalError()
               }
            cell.imageOutlet.image = UIImage(named: filteredData[indexPath.row])
            cell.dataLabel.text = filteredData[indexPath.row]
            return cell
        }
        
        
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            filteredData = searchText.isEmpty ? nameArr : nameArr.filter { (temp: String) -> Bool in
                // If dataItem matches the searchText, return true to include it
                return temp.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
                
            }
            if filteredData .isEmpty {
                let alert = UIAlertController(title: "Alert", message: "Please Enter valid user name:", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            collectionViewOutlet.reloadData()
        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            //let selectedImage = collectionView.cellForItem(at: indexPath) as! CellData
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CellData else {
//                fatalError()
//            }
            
            if isClicked == true {
            self.myImagelarger.image = UIImage(named: filteredData[indexPath.row])
            isClicked = false
            }
            else {
                self.myImagelarger.image = nil
                isClicked = true
            }
       
        }
        
     }

class CellData: UICollectionViewCell {
    @IBOutlet weak var imageOutlet: UIImageView!
    
    @IBOutlet weak var dataLabel: UILabel!
}
