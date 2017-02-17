//
//  TableViewController.swift
//  Jupigo
//
//  Created by XINHAO LI on 2/12/17.
//  Copyright © 2017 XINHAO LI. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
  var tasks : [Task] = []
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    // get the data from core data
    getData()
  
    // reload the table view
    tableView.reloadData()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tasks.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    let task = tasks[indexPath.row]
    cell.textLabel?.text = task.color!
    return cell
  }
  
  func getData() {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
    do {
      tasks = try context.fetch(Task.fetchRequest())
    } catch {
      print("Fetching Failed")
    }
  }
  
  // Delete cell functionality
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    if editingStyle == .delete {
      let task = tasks[indexPath.row]
      context.delete(task)
      (UIApplication.shared.delegate as! AppDelegate).saveContext()
      
      do {
        tasks = try context.fetch(Task.fetchRequest())
      } catch {
        print("Fetching Failed")
      }
      
    }
    tableView.reloadData()
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "pass", sender: tasks[indexPath.row])
    
  }
  
  // Init the segue task
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let guest = segue.destination as! DetailViewController
    guest.task = sender as? Task
    segue.destination.hidesBottomBarWhenPushed = true
  }

}
