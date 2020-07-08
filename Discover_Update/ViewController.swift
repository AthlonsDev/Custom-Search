//
//  ViewController.swift
//  Discover_Update
//
//  Created by Athlosn90 on 12/04/2020.
//  Copyright © 2020 Athlosn90. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    
    lazy var myView: View = {
               let pv = View()
               pv.controller = self
               return pv
      }()

    
    var titleString = String()
    let cellID = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.autocapitalizationType = .words
        searchBar.autocorrectionType = .default
        searchBar.barStyle = .default
        searchBar.layer.borderColor = UIColor.black.cgColor
        searchBar.layer.borderWidth = 0.5
        navigationItem.titleView = searchBar
        myView.addUI(view: view)


        myView.collectionView.delegate = self
        myView.collectionView.dataSource = self
        
    }

    
    
    var jsonItems = [items]()
    var jsonReviews = [pageMap]()
    let searchBar = UISearchBar()
    

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        Model.sharedInstance.getCustomSearchData(search: searchBar.text!) { (flag) in
            
            self.jsonItems = Model.sharedInstance.jsonItems
            
            DispatchQueue.main.async {
                
                self.myView.collectionView.reloadData()

            }
            
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        Model.sharedInstance.getCustomSearchData(search: searchBar.text!) { (flag) in
            
        if flag == true {
            self.jsonItems = Model.sharedInstance.jsonItems
            
                DispatchQueue.main.async {
                
                    self.myView.collectionView.reloadData()
                
                }
            
            }
        }
    }

    
    
    public func processImage(image: String, cell: DefaultCell) {
        
        
        let url = URL(string: image)
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            
            if error != nil {
                
                print(error?.localizedDescription)
                
            }
            DispatchQueue.main.async {
                if data != nil {
                    
                    if let downloadedimage = UIImage(data: data!){
                        
                        cell.reviewImage.image = downloadedimage
                        cell.reviewImage.contentMode = .scaleAspectFill
                        
                    }
                } else {
                    
                }
            }
            
        }).resume()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsonItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! DefaultCell
        
        
        let stringToProcess = jsonItems[indexPath.item].pagemap.cse_image?[0].src ?? "ImageNotFound"
        let title = jsonItems[indexPath.item].title
        let review = jsonItems[indexPath.item].pagemap.review?[0].reviewbody
        let name = jsonItems[indexPath.item].pagemap.person?[0].name
        
//        Process url link to UIImage
        processImage(image: stringToProcess, cell: cell)
        
        cell.titleView.text = title
        cell.reviewView.text = review
        cell.nameView.text = name
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        Identifiy Which cell has Been Selected
        guard let indexPath = collectionView.indexPathsForSelectedItems else {return}
        let selectedCell = collectionView.cellForItem(at: indexPath[0] as IndexPath) as! DefaultCell
        
        
        print(selectedCell.titleView.text)
        titleString = selectedCell.titleView.text!

//        Pass Values to Another View or Anything else
        
    }
    
}

