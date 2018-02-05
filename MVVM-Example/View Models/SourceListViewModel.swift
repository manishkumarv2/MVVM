//
//  SourceListViewModel.swift
//  MVVM-Example
//
//  Created by Manish Kumar on 2/2/18.
//  Copyright © 2018 v2solutions. All rights reserved.
//

import Foundation
class SourceListViewModel : NSObject {
    
    @objc dynamic private(set) var sourceViewModels :[SourceViewModel] = [SourceViewModel]()
    private var webservice :Webservice
    var bindToSourceViewModels :(() -> ()) = {  }
    private var token :NSKeyValueObservation?
    
    init(webservice :Webservice) {
        
        self.webservice = webservice
        super.init()
        
        token = self.observe(\.sourceViewModels) { _,_ in
            self.bindToSourceViewModels()
        }
        // call populate sources
        populateSources()
    }
    func invalidateObservers() {
        self.token?.invalidate()
    }
    
    func populateSources() {
        
        self.webservice.loadSources { [unowned self] sources in
            self.sourceViewModels = sources.flatMap(SourceViewModel.init)
        }
    }
    
    func source(at index:Int) -> SourceViewModel {
        return self.sourceViewModels[index]
    }
}

// SourceViewModel
class SourceViewModel : NSObject {
    
    var id :String?
    var name :String
    var body :String
    
    init(name :String, description: String) {
        self.name = name
        self.body = description
    }
    
    init(source :Source) {
        
        self.id = source.id
        self.name = source.name
        self.body = source.description
    }
}
