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

class Model: NSObject {
    
    static let sharedInstance = Model()
        var flag = Bool()
        var jsonItems = [items]()
        var longitude: Double?
        var latitude: Double?
        typealias CompletionHandler = (_ success:Bool) -> Void

        
        func getCustomSearchData(search: String, completionHandler: @escaping CompletionHandler) {
            
//            API of Google Custom Search which can be Customized
            let apiKey = "Paste Your API Key"
                        let bundleId = "Foodys.Discover-Update"
                        let searchEngineId = "Paste Your Search ID"
                        let serverAddress = String(format: "Paste Your GoogleApis link",search ,searchEngineId, apiKey)


                        guard serverAddress.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) != nil else {return}
                        
                        let url = serverAddress.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                        let finalUrl = URL(string: url!)
                        let request = NSMutableURLRequest(url: finalUrl!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
                        request.httpMethod = "GET"
                        request.setValue(bundleId, forHTTPHeaderField: "X-Ios-Bundle-Identifier")

                        let session = URLSession.shared

                        let datatask = session.dataTask(with: request as URLRequest) { (data, response, error) in
                            
                            guard let data = data else {return}

                            do{
                                
                                let jsonObject = try JSONSerialization.jsonObject(with: data,
                                                                                          options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                                
//                                Start Decoding Json
                                let jsonData = try JSONDecoder().decode(websiteDescription.self, from: data)
                                
                                self.jsonItems.removeAll()
                                
                                
//                                Examples of Data that can be Taken from a Custom Search
                                let items = jsonData.items
                                let imageLink = String(describing: jsonData.items[0].pagemap.cse_image?[0].src)
                                let review = String(describing: jsonData.items[0].pagemap.review?[0].reviewbody)
                                let fullName = String(describing: items[0].pagemap.metatags[0].fullName)
            //                  let date = String(describing: jsonData.items[0].pagemap.review[0].datepublished)
                                let name = String(describing: jsonData.items[0].pagemap.person?[0].name)
                                let rating = String(describing: jsonData.items[0].pagemap.rating?[0].ratingvalue)
                                let fbProfile = String(describing: items[0].pagemap.metatags[0].profile)
                                let telephone = String(describing: items[0].pagemap.metatags[0].telephone)
                                let title = String(describing: items[0].pagemap.metatags[0].title)
                                let longitude = String(describing: items[0].pagemap.metatags[0].longitude)
                                let latitude = String(describing: items[0].pagemap.metatags[0].latitude)
                       
                                DispatchQueue.main.async {
                                    
                                    self.jsonItems = items
                                    self.flag = true
                                    completionHandler(self.flag)
                                    
                                }
                                
                            }
                            catch let error as NSError {
                                print(error)
                            }
                        }
                        datatask.resume()
        }

}
