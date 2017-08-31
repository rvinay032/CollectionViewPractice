//
//  TableViewClassViewController.swift
//  CollectionViewPractice
//
//  Created by appinventiv on 31/08/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class TableViewClassViewController: UIViewController, UISearchBarDelegate {

    var filteredData: [String]!
    let searchController = UISearchController(searchResultsController: nil)
    var nameArr = [String]()
    
    
    @IBOutlet weak var searchBarTable: UISearchBar!
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        searchBarTable.delegate = self
        filteredData = nameArr
    }
    
    
}

extension TableViewClassViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DataCell
        cell.dataLabel.text = filteredData[indexPath.row]
        cell.imageOutlet.image = UIImage(named: filteredData[indexPath.row])
        return cell
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = searchText.isEmpty ? nameArr : nameArr.filter { (temp: String) -> Bool in

            return temp.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            
        }
//        if filteredData12 .isEmpty {
//            let alert = UIAlertController(title: "Alert", message: "Please Enter valid user name:", preferredStyle: UIAlertControllerStyle.alert)
//            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }
        
        tableViewOutlet.reloadData()
    }
  
}



class DataCell: UITableViewCell {
    
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
}
