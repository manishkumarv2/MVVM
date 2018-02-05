//
//  Webservice.swift
//  MVVM-Example
//
//  Created by Manish Kumar on 2/2/18.
//  Copyright © 2018 v2solutions. All rights reserved.
//

import Foundation

class Webservice {
    
    private let sourcesURL = URL(string: "https://newsapi.org/v2/sources?apiKey=0cf790498275413a9247f8b94b3843fd")!
    
    func loadSources(completion :@escaping ([Source]) -> ()) {
        
        URLSession.shared.dataTask(with: sourcesURL) { data, _, _ in
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let sourceDictionary = json as! JSONDictionary
                let dictionaries = sourceDictionary["sources"] as! [JSONDictionary]
                
                let sources = dictionaries.flatMap(Source.init)
                
                DispatchQueue.main.async {
                    completion(sources)
                }
            }
            
            }.resume()
        
    }
}
