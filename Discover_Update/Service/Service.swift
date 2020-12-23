//
//  Service.swift
//  Discover_Update
//
//  Created by Athlosn90 on 19/10/2020.
//  Copyright © 2020 Athlosn90. All rights reserved.
//

import Foundation


class Service: NSObject {
    
    static let sharedInstance = Service()
        var flag = Bool()
        var jsonItems = [items]()
        var longitude: Double?
        var latitude: Double?

        func getCustomSearchData(search: String, completion: @escaping ([items]?, Error?) -> ()) {
            
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
                            let jsonData = try JSONDecoder().decode(websiteDescription.self, from: data)
                                
                            self.jsonItems.removeAll()

                            let items = jsonData.items
                       
                                DispatchQueue.main.async {
                                    
                                    completion(items, nil)
                                    
                                }
                                
                            }
                            catch let error as NSError {
                                print(error)
                            }
                        }
              datatask.resume()
        }

}

