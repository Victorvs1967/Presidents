//
//  LanguageListControllerTableViewController.swift
//  Presidents
//
//  Created by Victor Smirnov on 07/12/2017.
//  Copyright © 2017 Victor Smirnov. All rights reserved.
//

import UIKit

class LanguageListController: UITableViewController {
  
  weak var detailViewController: DetailViewController? = nil
  private let languageNames: [String] = ["English", "French", "Geram", "Russian"]
  private let languageCodes: [String] = ["en", "fr", "de", "ru"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    self.clearsSelectionOnViewWillAppear = false
    preferredContentSize = CGSize(width: 320, height: languageCodes.count * 44)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return languageCodes.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    // Configure the cell...
    cell.textLabel?.text = languageNames[indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    detailViewController?.languageString = languageCodes[indexPath.row]
    dismiss(animated: true, completion: nil)
  }
}
