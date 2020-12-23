//
//  CustomCollection.swift
//  
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
    
    
    var viewModel: ViewModel! {
        didSet {
            nameView.text = viewModel.title
            titleView.text = viewModel.name
        }
    }
    
    var imageMod: ItemImage! {
        didSet {
            if let JsonImage = imageMod.image {
                processImage(image: JsonImage, completion: { (image) in
                    
                    self.ItemImage.image = image
                    
                })
            }
            
        }
    }
    
    var revModel: reviewModel! {
        didSet{
            DescriptionView.text = revModel.reviewBody
            
        }
    }
    
    var nameView: UILabel = {
        
        var nameView = UILabel()
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.font = UIFont.boldSystemFont(ofSize: 17)
        nameView.isUserInteractionEnabled = true
        
        return nameView
    }()
    
    var ItemImage: UIImageView = {
        
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
    
    var DescriptionView: UITextView = {
        
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
        
        
        addSubview(DescriptionView)
        addSubview(footerView)
        addSubview(likeView)
        addSubview(commentsView)
        addSubview(shareView)
        addSubview(ItemImage)
        addSubview(categoryView)
        addSubview(placeView)
        addSubview(nameView)
        addSubview(titleView)
        
        
        
        ItemImage.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        ItemImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        ItemImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        ItemImage.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        ItemImage.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        DescriptionView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        DescriptionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        DescriptionView.topAnchor.constraint(equalTo: ItemImage.bottomAnchor, constant: 50).isActive = true
        DescriptionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        titleView.topAnchor.constraint(equalTo: ItemImage.bottomAnchor, constant: 0).isActive = true
        titleView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        titleView.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        titleView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true

       
        nameView.topAnchor.constraint(equalTo: DescriptionView.bottomAnchor, constant: 10).isActive = true
        nameView.leftAnchor.constraint(equalTo: leftAnchor, constant: 60).isActive = true
        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


