//
//  Model.swift
//  Discover_Update
//
//  Created by Athlosn90 on 08/07/2020.
//  Copyright © 2020 Athlosn90. All rights reserved.
//

import Foundation
import UIKit

struct websiteDescription: Decodable{
    let name: String?
    let description: String?
    let items:[items]
    let kind: String?
    let context: context
    
}


struct items: Decodable {
    let displayLink: String
    let kind: String
    let pagemap: pageMap
    let title: String
    
}

struct context: Codable {
   let title: String?
}

struct pageMap: Decodable {
    let cse_image: [cse_image]?
    let review: [review]?
    let person: [name]?
    let rating: [rating]?
    let metatags: [metatags]
}

struct review: Codable {
    let datepublished: String?
    let reviewbody: String?

}

struct metatags: Decodable
{
    let profile: String?
    let title: String?
    let fullName: String?
    let telephone: String?
    let latitude: String?
    let longitude: String?
    let url: String?

    private enum CodingKeys : String, CodingKey
    {
        case profile = "fb:profile_id", title = "og:description", telephone = "business:contact_data:phone_number", latitude = "place:location:latitude", longitude  = "place:location:longitude", url = "business:contact_data:website", fullName = "og:title"
    }
}

struct name: Codable {
   let name: String?
}
struct rating: Codable {
   let ratingvalue: String?
}

struct cse_image: Codable {
//    let cse_image: NSDictionary?
    let src: String?
}

struct src: Codable {
    let src: String?
}
