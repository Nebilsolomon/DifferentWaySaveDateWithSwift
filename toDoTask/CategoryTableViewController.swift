//
//  CategoryTableViewController.swift
//  toDoTask
//
//  Created by nebil on 8/24/20.
//  Copyright © 2020 nebilgokdemir. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {

    
    var myArray = [MyCategory]()
    var contex = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
   
    override func viewDidLoad() {
        super.viewDidLoad()

   loadData()
        
        
        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
        
    }
    
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cCell", for: indexPath)
        cell.textLabel?.text = myArray[indexPath.row].name
        
        return cell
        
    }
    
    
    
    
    // MARK: Add New Catagory
    
    @IBAction func add(_ sender: UIBarButtonItem) {
     var myTextField = UITextField()
    
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newCategorty = MyCategory(context: self.contex!)
            newCategorty.name = myTextField.text
            self.myArray.append(newCategorty)

            self.saveData()
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (textField) in
            myTextField = textField
            
        }
        
        alert.addAction(alertAction)
        
        
        self.present(alert, animated: true, completion: nil)
       

        
        
  

    
    }
    
    //MARK: Save Data
    
    func saveData()  {
        
        do {
            
            try   contex?.save()
            
        }
        catch {
            
            
        }
        
        
    }
    
    
    // MARK: Load Data from Core Data
    func loadData()  {
     
    
        let requestt: NSFetchRequest <MyCategory>    = MyCategory.fetchRequest()
        do {
          
            self.myArray =   try contex?.fetch(requestt) as! [MyCategory]
        
        }catch {
            
            
        }
        tableView.reloadData()
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        contex?.delete(myArray[indexPath.row])
        myArray.remove(at: indexPath.row)
        
        tableView.reloadData()
        self.saveData()
        
        
        
    }
    

    
    
}
