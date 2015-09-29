//
//  PostsListVC.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import UIKit

class PostsListVC: UIViewController, UITableViewDataSource {

    // MARK: - IBOutlet -
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties -
    
    var presenter: PostsListPresenter?
    var tableViewData: [PostsListViewModel]?
    
    // MARK: - View Life Cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.updateView()
    }
    
    // MARK: - Helpers -
    
    func reloadData() {
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource -
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = tableViewData else {
            return 0
        }
        
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        let post = tableViewData![indexPath.row]
        cell.textLabel?.text = post.title
        
        return cell
    }

}
