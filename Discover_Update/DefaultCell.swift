//
//  CustomCollection.swift
//  Project_FoodApp
//
//  Created by Athlons90 on 07/08/2018.
//  Copyright © 2018 Athlons90. All rights reserved.
//
import Foundation
import UIKit

class DefaultCell: UICollectionViewCell {
    
    
    
    var footerView = UIView()
    var likeView = UIView()
    var commentsView = UIView()
    var shareView = UIView()
    var categoryView = UIView()
    var placeView = UIView()
    
    
    var nameView: UILabel = {
        
        var nameView = UILabel()
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.font = UIFont.boldSystemFont(ofSize: 17)
        nameView.isUserInteractionEnabled = true
        
        return nameView
    }()
    
    var reviewImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var titleView: UILabel = {
        
        var textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.font = UIFont.boldSystemFont(ofSize: 20)
        textView.isUserInteractionEnabled = true
        
        return textView
    }()
    
    var reviewView: UITextView = {
        
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        
        return textView
    }()

    
    
    var likedBy = [String]()
    var sharedBy = [String]()
    var postPreferences = [String]()
    var numberOfComments = Int()
    var latitude = Double()
    var longitude = Double()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
        
    }
    
    func setupLayout() {
        
        
        addSubview(reviewView)
        addSubview(footerView)
        addSubview(likeView)
        addSubview(commentsView)
        addSubview(shareView)
        addSubview(reviewImage)
        addSubview(categoryView)
        addSubview(placeView)
        addSubview(nameView)
        addSubview(titleView)
        
        
        
        reviewImage.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        reviewImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        reviewImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        reviewImage.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        reviewImage.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        reviewView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        reviewView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        reviewView.topAnchor.constraint(equalTo: reviewImage.bottomAnchor, constant: 50).isActive = true
        reviewView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        titleView.topAnchor.constraint(equalTo: reviewImage.bottomAnchor, constant: 0).isActive = true
        titleView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        titleView.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        titleView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true

       
        nameView.topAnchor.constraint(equalTo: reviewView.bottomAnchor, constant: 10).isActive = true
        nameView.leftAnchor.constraint(equalTo: leftAnchor, constant: 60).isActive = true
        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


