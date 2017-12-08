//
//  MasterViewController.swift
//  Presidents
//
//  Created by Victor Smirnov on 06/12/2017.
//  Copyright © 2017 Victor Smirnov. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
  
  var detailViewController: DetailViewController? = nil
  var presidents: [[String: String]]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let path = Bundle.main.path(forResource: "PresidentList", ofType: "plist")
    let presidentInfo = NSDictionary(contentsOfFile: path!)!
    presidents = presidentInfo["presidents"]! as! [[String: String]]
    
    if let split = splitViewController {
      let controllers = split.viewControllers
      detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
    super.viewWillAppear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @objc
  func insertNewObject(_ sender: Any) {
    let indexPath = IndexPath(row: 0, section: 0)
    tableView.insertRows(at: [indexPath], with: .automatic)
  }
  
  // MARK: - Segues
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
      if let indexPath = self.tableView.indexPathForSelectedRow {
        let object = presidents[indexPath.row]
        let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
        if let oldController = detailViewController {
          controller.languageString = oldController.languageString
        }
        controller.detailItem = object
        controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
        controller.navigationItem.leftItemsSupplementBackButton = true
        detailViewController = controller
      }
    }
  }
  
  // MARK: - Table View
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presidents.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    let president = presidents[indexPath.row]
    cell.textLabel!.text = president["name"]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }
  
  
}

