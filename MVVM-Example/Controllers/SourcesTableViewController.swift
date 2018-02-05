//
//  SourcesTableViewController.swift
//  MVVM-Example
//
//  Created by Manish Kumar on 2/5/18.
//  Copyright © 2018 v2solutions. All rights reserved.
//

import Foundation
import UIKit

struct Cells {
    static let headline = "HeadlineTableViewCell"
    static let source = "SourceTableViewCell"
}

class SourcesTableViewController : UITableViewController {
    
    private var webservice :Webservice!
    private var sourceListViewModel :SourceListViewModel!
    private var dataSource :TableViewDataSource<SourceTableViewCell,SourceViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    private func updateUI() {
        
        self.webservice = Webservice()
        self.sourceListViewModel = SourceListViewModel(webservice: self.webservice)

        // setting up the bindings
        self.sourceListViewModel.bindToSourceViewModels = {
            self.updateDataSource()
        }
    }
    
    private func updateDataSource() {
        
        self.dataSource = TableViewDataSource(cellIdentifier: Cells.source, items: self.sourceListViewModel.sourceViewModels) { cell, vm in
            
            cell.nameLabel.text = vm.name
            cell.descriptionLabel.text = vm.body
        }
        
        self.tableView.dataSource = self.dataSource
        self.tableView.reloadData()
    }
    
}
