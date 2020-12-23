//
//  ViewController.swift
//  Discover_Update
//
//  Created by Athlosn90 on 12/04/2020.
//  Copyright © 2020 Athlosn90. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UISearchBarDelegate {

    
//    lazy var myView: View = {
//               let pv = View()
//               pv.controller = self
//               return pv
//      }()

    
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

    }

    
    var viewModel = [ViewModel]()
    var jsonReviews = [pageMap]()
    let searchBar = UISearchBar()
    var searchTerm = String()
    

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            getData()
    }
    
    func getData() {
        Service.sharedInstance.getCustomSearchData(search: searchTerm){ (courses, err) in
        if let err = err {
            print("Failed to fetch courses:", err)
            return
        }
            self.viewModel = courses?.map({return ViewModel(data: $0)}) ?? []
            self.collectionView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getData()
    }

    
    fileprivate func setupCollectionView() {
        collectionView.register(DefaultCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.tag = 0
        collectionView.allowsMultipleSelection = true
        collectionView.isUserInteractionEnabled = true
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.layout.estimatedItemSize = CGSize(width: view.frame.width, height: view.frame.height / 2)
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
                        
                        cell.ItemImage.image = downloadedimage
                        cell.ItemImage.contentMode = .scaleAspectFill
                        
                    }
                } else {
                    
                }
            }
            
        }).resume()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! DefaultCell
        
        let viewMod = viewModel[indexPath.item]
        cell.viewModel = viewMod
//        let stringToProcess = viewModel[indexPath.item].pagemap.cse_image[0].src ?? "ImageNotFound"
////        let title = viewModel[indexPath.item].title
//        let review = viewModel[indexPath.item].pagemap.review[0].reviewbody
//        let name = viewModel[indexPath.item].pagemap.person[0].name
        
        
//        Process url link to UIImage
//        processImage(image: stringToProcess, cell: cell)
//        
//        cell.titleView.text = title
//        cell.reviewView.text = review
//        cell.nameView.text = name
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        Identifiy Which cell has Been Selected
        guard let indexPath = collectionView.indexPathsForSelectedItems else {return}
        let selectedCell = collectionView.cellForItem(at: indexPath[0] as IndexPath) as! DefaultCell
        
        
        print(selectedCell.titleView.text)
        titleString = selectedCell.titleView.text!

//        Pass Values to Another View or Anything else
        
    }
    
}


extension DefaultCell {
    func processImage(image: String, completion: @escaping (UIImage?)->()) {
        
        
        let url = URL(string: image)
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            
            if error != nil {
                
                print(error?.localizedDescription)
                
            }
            DispatchQueue.main.async {
                if data != nil {
                    
                    if let downloadedimage = UIImage(data: data!){
 
                        completion(downloadedimage)
                        
                    }
                } else {
                    
                }
            }
            
        }).resume()
        
    }
}

