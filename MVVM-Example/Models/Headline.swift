//
//  Headline.swift
//  MVVM-Example
//
//  Created by Manish Kumar on 2/5/18.
//  Copyright © 2018 v2solutions. All rights reserved.
//

import Foundation
class Headline {
    
    var title :String!
    var description :String!
    
    init?(dictionary :JSONDictionary) {
        
        guard let title = dictionary["title"] as? String,
            let description = dictionary["description"] as? String else {
                return nil
        }
        
        self.title = title
        self.description = description
    }
}
