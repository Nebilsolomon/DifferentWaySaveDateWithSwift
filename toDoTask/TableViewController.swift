//
//  TableViewController.swift
//  toDoTask
//
//  Created by nebil on 8/18/20.
//  Copyright © 2020 nebilgokdemir. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var myArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myArray.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = myArray[indexPath.row]
        
        return cell
    }
    

         //MARK: Mark cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .detailButton
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {

            tableView.cellForRow(at: indexPath)?.accessoryType = .none

        }
        else {

            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        }
        
   
       
        
        tableView.deselectRow(at: indexPath, animated: true)
    
        
        
    }
    
    //MARK: -  ADD new Item
    
    
    
    @IBAction func addNewAction(_ sender: UIBarButtonItem) {
     var  myText = UITextField()
    
        let alert = UIAlertController(title: "Add New Item", message:"", preferredStyle: .alert)
        
 
        let alerAction = UIAlertAction(title: "ADD", style: .default) { (action) in
            
            self.myArray.append(myText.text!)
            self.tableView.reloadData()
            
            //print(myText.text!)

            
        }
       
        alert.addTextField { (textfield) in
            textfield.placeholder = "please add item"
            
            myText = textfield
            
        }
        
        alert.addAction(alerAction)
        

        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
}


