//
//  TableViewController.swift
//  toDoTask
//
//  Created by nebil on 8/18/20.
//  Copyright © 2020 nebilgokdemir. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var saveData = UserDefaults.standard
    var myArray = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let item = Item()

        item.title = "nebil"
        
        myArray.append(item)
        
        let item2 = Item()

           item2.title = "gokdemir"
           
           myArray.append(item2)

        let item3 = Item()

           item3.title = "silo"
           
           myArray.append(item3)


        
        
//        if  let item = saveData.array(forKey: "nebil") as? [String] {
//
//            myArray = item
//        }
 
    
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myArray.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = myArray[indexPath.row].title
        
        if myArray[indexPath.row].done == false {
            
            cell.accessoryType = .none
        }
        else {
            cell.accessoryType = .checkmark
        }
        
        
        return cell
    }
    

         //MARK: Mark cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        if myArray[indexPath.row].done == false {
            
            myArray[indexPath.row].done = true
           
        }
        else {
            
            myArray[indexPath.row].done = false
            
        }
        
        
        tableView.reloadData()
        
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//
//        }
//        else {
//
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//
//        }
        
   
       
        
        tableView.deselectRow(at: indexPath, animated: true)
    
        
        
    }
    
    //MARK: -  ADD new Item
    
    
    
    @IBAction func addNewAction(_ sender: UIBarButtonItem) {
     var  myText = UITextField()
    
        let alert = UIAlertController(title: "Add New Item", message:"", preferredStyle: .alert)
        
 
        let alerAction = UIAlertAction(title: "ADD", style: .default) { (action) in
            
           let item = Item()
            item.title = myText.text!
            self.myArray.append(item)
          //  self.saveData.set(self.myArray, forKey: "nebil")
   
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


