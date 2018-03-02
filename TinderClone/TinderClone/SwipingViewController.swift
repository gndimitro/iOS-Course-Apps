//
//  SwipingViewController.swift
//  TinderClone
//
//  Created by George Dimitrov on 2018-02-17.
//  Copyright © 2018 George Dimitrov. All rights reserved.
//

import UIKit
import FacebookLogin
import FirebaseDatabase
import FirebaseStorage

class SwipingViewController: UIViewController {
    
    @IBOutlet var userImage: UIImageView!
    var databaseReference: DatabaseReference!
    var storageReference: StorageReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let usersRefernce = databaseReference.child("users")
        
        usersRefernce.queryOrdered(byChild: "gender").queryEqual(toValue: "female")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "logOut" {
            LoginManager.init().logOut()
        }
    }

}
