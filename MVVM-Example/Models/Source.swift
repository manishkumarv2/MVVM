//
//  Source.swift
//  MVVM-Example
//
//  Created by Manish Kumar on 2/2/18.
//  Copyright © 2018 v2solutions. All rights reserved.
//

import Foundation
class Source {
    
    var id :String!
    var name :String!
    var description :String!
    
    init?(dictionary :JSONDictionary) {
        
        guard let id = dictionary["id"] as? String,
            let name = dictionary["name"] as? String,
            let description = dictionary["description"] as? String else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.description = description
    }
    
    init(viewModel :SourceViewModel) {
        
        self.id = viewModel.id
        self.name = viewModel.name
        self.description = viewModel.body
    }
    
}
