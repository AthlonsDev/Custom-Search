//
//  View.swift
//  Discover_Update
//
//  Created by Athlosn90 on 07/07/2020.
//  Copyright © 2020 Athlosn90. All rights reserved.
//

import Foundation
import UIKit

class View: UIView {
    
    
    var controller: ViewController?
    var cellID = "cell"
    let layout = UICollectionViewFlowLayout()
    
    lazy var collectionView: UICollectionView = {
        
        var collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height), collectionViewLayout: layout)
        collectionView.register(DefaultCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.tag = 0
        collectionView.allowsMultipleSelection = true
        collectionView.isUserInteractionEnabled = true
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func addUI(view: UIView) {
        view.addSubview(collectionView)

        layout.estimatedItemSize = CGSize(width: view.frame.width, height: view.frame.height / 2)

        let collectionViewConstraints = [collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                         collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                         collectionView.widthAnchor.constraint(equalToConstant: view.frame.width),
                                         collectionView.heightAnchor.constraint(equalToConstant: view.frame.height)]

        NSLayoutConstraint.activate(collectionViewConstraints)

    }
    
}
