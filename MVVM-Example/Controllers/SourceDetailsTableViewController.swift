//
//  SourceDetailsTableViewController.swift
//  MVVM-Example
//
//  Created by Manish Kumar on 2/5/18.
//  Copyright © 2018 v2solutions. All rights reserved.
//

import Foundation
import UIKit

class SourceDetailsTableViewController : UITableViewController {
    
    var sourceViewModel :SourceViewModel!
    private var headlineListViewModel :HeadlineListViewModel!
    private var dataSource :TableViewDataSource<HeadlineTableViewCell,HeadlineViewModel>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .always
        updateUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func updateUI() {
        
        self.title = self.sourceViewModel.name
        self.headlineListViewModel = HeadlineListViewModel(source :sourceViewModel)
        
        self.headlineListViewModel.populateHeadlines {
            
            // setup the data source here
            self.dataSource = TableViewDataSource(cellIdentifier: Cells.headline, items: self.headlineListViewModel.headlines) { cell, vm in
                
                cell.titleLabel.text = vm.title
                cell.descriptionLabel.text = vm.description
            }
            
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }
}
