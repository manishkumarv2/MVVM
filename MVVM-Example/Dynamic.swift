//
//  Dynamic.swift
//  MVVM-Example
//
//  Created by Manish Kumar on 2/2/18.
//  Copyright © 2018 v2solutions. All rights reserved.
//

import Foundation
class Dynamic<T> {
    
    var bind :(T) -> () = { _ in }
    
    var value :T? {
        didSet {
            bind(value!)
        }
    }
    
    init(_ v :T) {
        value = v
    }
    
}
