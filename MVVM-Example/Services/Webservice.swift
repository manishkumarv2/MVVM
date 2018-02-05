//
//  Webservice.swift
//  MVVM-Example
//
//  Created by Manish Kumar on 2/2/18.
//  Copyright © 2018 v2solutions. All rights reserved.
//

import Foundation

let baseURL = "https://newsapi.org/v2"
let API_KEY = "0cf790498275413a9247f8b94b3843fd"

class Webservice {
    
    func loadSources(completion :@escaping ([Source]) -> ()) {
        let sourcesURL = URL(string: "\(baseURL)/sources?apiKey=\(API_KEY)")!
        
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
    
    func loadHeadlinesByCourse(source :Source, completion :@escaping ([Headline]) -> ()) {
        
//        print(source.id)
        
        let urlString = "\(baseURL)/top-headlines?sources=\((source.id)!)&apiKey=\(API_KEY)"
        
        let articlesBySourceURL = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: articlesBySourceURL) { data, _, _ in
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let result = json as! JSONDictionary
                let dictionaries = result["articles"] as! [JSONDictionary]
                
                let headlines = dictionaries.flatMap(Headline.init)
                
                DispatchQueue.main.async {
                    completion(headlines)
                }
                
            }
            
            }.resume()
    }
    
}
