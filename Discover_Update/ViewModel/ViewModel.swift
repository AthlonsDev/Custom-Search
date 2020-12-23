//
//  ViewModel.swift
//  Discover_Update
//
//  Created by Athlosn90 on 19/10/2020.
//  Copyright © 2020 Athlosn90. All rights reserved.
//

import Foundation

struct ViewModel {
    
   let title: String
    let name: String?
    
   
    
    
//    Dependency Injection
    init(data: items) {
        
        self.title = data.title
        
        self.name = data.displayLink
        
        
        
    }
}

struct ItemImage {
    
    let image: String?
    
    init(data: cse_image) {
        
        self.image = data.src
        
    }
    
    
}

struct reviewModel {
    
    let reviewBody: String?
    let date: String?
   
    
    
//    Dependency Injection
    init(data: review) {
        
        self.reviewBody = data.reviewbody
        
        self.date = data.datepublished
        
        
    }
}
