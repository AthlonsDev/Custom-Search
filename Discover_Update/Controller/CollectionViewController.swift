//
//  CollectionViewController.swift
//  Discover_Update
//
//  Created by Athlosn90 on 19/10/2020.
//  Copyright © 2020 Athlosn90. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UITableView {
    
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        Model.sharedInstance.getCustomSearchData(search: searchBar.text!) { (flag) in
            
            self.jsonItems = Model.sharedInstance.jsonItems
            
            DispatchQueue.main.async {
                
                self.tableView.reloadData()

            }
            
        }
    }
    
}
