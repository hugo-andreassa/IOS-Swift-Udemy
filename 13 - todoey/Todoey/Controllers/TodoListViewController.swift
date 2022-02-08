//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    
    var itemArray: [Item] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
        loadItems()
    }
    
    // MARK - Setup Methods
    func setupNavigationItem() {
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        rightBarButton.tintColor = .white
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    // MARK - Add New Items
    @objc func addItem() {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let item = Item(context: self.context)
            item.title = textField.text
            item.done = false
            self.itemArray.append(item)
        
            self.tableView.reloadData()
            self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveItems() {
        do {
            try context.save()
            self.tableView.reloadData()
        } catch {
            print("Error saving context \(error)")
        }
    }
    
    func loadItems() {
        do {
            let request: NSFetchRequest<Item> = Item.fetchRequest()
            self.itemArray = try self.context.fetch(request)
            tableView.reloadData()
        } catch {
            print("Error fetching items \(error)")
        }
    }
    
    // MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
