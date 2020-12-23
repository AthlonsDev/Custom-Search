//
//  CustomCollection.swift
//  
//
//  Created by Athlons90 on 07/08/2018.
//  Copyright © 2018 Athlons90. All rights reserved.
//
import Foundation
import UIKit

class smallCell: UICollectionViewCell {
    
    
    
    var footerView = UIView()
    var likeView = UIView()
    var commentsView = UIView()
    var shareView = UIView()
    var categoryView = UIView()
    var placeView = UIView()
    
    
    var viewModel: ViewModel? {
        didSet{
            nameView.text = viewModel?.name
            titleView.text = viewModel?.title
        }
    }
    
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
        textView.textColor = .white
        textView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.5)

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
        
        addSubview(reviewImage)
        addSubview(reviewView)

        
        reviewImage.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        reviewImage.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        reviewImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        reviewImage.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        reviewImage.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        reviewView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        reviewView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        reviewView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


