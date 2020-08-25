//
//  TableViewController.swift
//  toDoTask
//
//  Created by nebil on 8/18/20.
//  Copyright © 2020 nebilgokdemir. All rights reserved.
//

import UIKit
import CoreData


class TableViewController: UITableViewController {
    
    var saveData = UserDefaults.standard
    var myArray = [Item]()
    
//    var dataPathFile = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("nebilllxx.plist")
   let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        
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
    

         //MARK: didSelectRow
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
        context?.delete(myArray[indexPath.row])
        myArray.remove(at: indexPath.row)
        
        
//        if myArray[indexPath.row].done == false {
//
//            myArray[indexPath.row].done = true
//
//        }
//        else {
//
//            myArray[indexPath.row].done = false
//
//        }
        
        dataSaved()
        tableView.reloadData()
        

        
   
       
        
        tableView.deselectRow(at: indexPath, animated: true)
    
        
        
    }
    
    //MARK: -  ADD new Item
    
    
    
    @IBAction func addNewAction(_ sender: UIBarButtonItem) {
     var  myText = UITextField()
     
        let alert = UIAlertController(title: "Add New Item", message:"", preferredStyle: .alert)
        
 
        let alerAction = UIAlertAction(title: "ADD", style: .default) { (action) in
         
            
           
            let item = Item(context: self.context!)
            item.title = myText.text
            item.done = false
            
            self.myArray.append(item)
         
            self.dataSaved()
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
    
    
    // MARK: Save Data
  
    
    func dataSaved()  {
        
        do {
         
            try self.context?.save()
          
          
          }catch {
              
              
              
          }
        
    }
    
    
    // MARK: Load DATA
    
    
    func loadData()  {
     
        let request:NSFetchRequest <Item>    = Item.fetchRequest()
        do {
            self.myArray =   try context?.fetch(request) as! [Item]
        
        }catch {
            
            
        }
        tableView.reloadData()
        
    }
    
    

    
    

    
    
}


// MARK: Extension

extension TableViewController : UISearchBarDelegate {
    
     func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
         
         
         let request : NSFetchRequest<Item> = Item.fetchRequest()
         let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
         
         request.predicate = predicate
         
         let sort = NSSortDescriptor(key: "title", ascending: true)
      
         request.sortDescriptors  = [sort]
         
    do {
        self.myArray =   try context?.fetch(request) as! [Item]
    
    }catch {
        
        
    }
         
         tableView.reloadData()
     }
    
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      
       
        if searchBar.text?.count == 0 {
            
            self.loadData()
            searchBar.resignFirstResponder()
        }
    }
    
}
