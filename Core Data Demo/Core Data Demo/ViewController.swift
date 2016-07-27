//
//  ViewController.swift
//  Core Data Demo
//
//  Created by George Dimitrov on 2016-07-26.
//  Copyright © 2016 SerpentSoftware. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
         //Commented code since data was added, uncomment if need to re-add data to database
        
        /*let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        
        newUser.setValue("Julie", forKey: "username")
        
        newUser.setValue("pasdfss1243", forKey: "password")
        
        do {
        
            try context.save()
        
        } catch {
            
            //Handle errors here
            print("There was an issue adding item to database")
        
        }*/
        
        let request = NSFetchRequest(entityName: "Users")
        
        //request.predicate = NSPredicate(format: "username = %@", "Yasir")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    //Top line is to delete the value
                    /*context.deleteObject(result)
                    
                    // Update the value
                    //result.setValue("Yasir", forKey: "username")
                    
                    do {
                        try context.save()
                    } catch {
                        //No handle of errors
                    }
                    
                    */
                    if let username = result.valueForKey("username") as? String {
                        print(username)
                    }
                }
                
            }
            
        } catch {
            
            print("Fetch failed")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

