//
//  PostsListVC.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import UIKit
import PKHUD

class PostsListVC: UIViewController, PostsListInterface, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlet -
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties -
    
    var presenter: PostsListPresenter?
    var data: [PostsListViewModel]?
    
    // MARK: - View Life Cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureHUD()
        
        presenter?.updateView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRowAtIndexPath(selectedIndexPath, animated: true)
        }
    }
    
    // MARK: - PostsListInterface -
    
    func setTableViewData(tableViewData: [PostsListViewModel]) {
        data = tableViewData
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func showHUD() {
        PKHUD.sharedHUD.show()
    }
    
    func dismissHUD() {
        PKHUD.sharedHUD.hide()
    }
    
    // MARK: - Helpers -
    
    private func configureTableView() {
        tableView.rowHeight          = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
    }
    
    private func configureHUD() {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
    }
    
    // MARK: - UITableViewDataSource -
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = data else {
            return 0
        }
        
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.numberOfLines = 0
        
        let post = data![indexPath.row]
        cell.textLabel?.text = post.title
        
        return cell
    }
    
    // MARK: - UITableViewDelegate -
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let post = data![indexPath.row]
        
        presenter?.handleCellSelection(post)
    }

}
