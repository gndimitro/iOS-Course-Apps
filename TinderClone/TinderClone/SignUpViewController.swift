//
//  SignUpViewController.swift
//  TinderClone
//
//  Created by George Dimitrov on 2018-02-11.
//  Copyright © 2018 George Dimitrov. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class SignUpViewController: UIViewController, LoginButtonDelegate {
    var databaseReference: DatabaseReference!
    var storageReference: StorageReference!
    @IBOutlet var interestedInWomen: UISwitch!
    @IBOutlet var userImage: UIImageView!
    
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        //Do nothing
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        performSegue(withIdentifier: "showLoginScreen", sender: self)
    }
    
    @IBAction func signUp(_ sender: Any) {
        saveUserData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load references to the DB and the storage
        databaseReference = Database.database().reference()
        storageReference = Storage.storage().reference()
        
        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email ])
        loginButton.center = view.center
        loginButton.center.y += 250
        loginButton.delegate = self
        view.addSubview(loginButton)
        
        GraphRequest(graphPath: "/me", parameters: ["fields": "id"]).start() { response, result in
            switch result {
            case .success(let response):
                if let user = Auth.auth().currentUser {
                    if let fbPicUrl = user.photoURL {
                        guard let data = try? Data(contentsOf: fbPicUrl) else {
                            print("There was an error!")
                            return
                        }
                        self.userImage.image = UIImage(data:data)
                    }
                }
                
                /*
                 let dictionaryResponse = response.dictionaryValue as? [String:String]
                 let facebookProfilePicUrl = "https://graph.facebook.com/"+dictionaryResponse!["id"]!+"/picture?type=large"
                if let fbPicUrl = URL(string: facebookProfilePicUrl) {
                    guard let data = try? Data(contentsOf: fbPicUrl) else {
                        print("There was an error!")
                        return
                    }
                    self.userImage.image = UIImage(data:data)
                }*/
            default:
                break
            }
        }
    }
    
    func saveUserData() {
        GraphRequest(graphPath: "/me", parameters: ["fields": "id, name, gender"]).start() { response, result in
            switch result {
            case .success(let response):
                print(response)
                let dictionaryResponse = response.dictionaryValue as? [String:String]
                let userUid = Auth.auth().currentUser!.uid
                self.databaseReference.child("users").child(userUid).setValue(["name": dictionaryResponse!["name"]!, "gender":dictionaryResponse!["gender"]!, "interestedInWomen":self.interestedInWomen.isOn])
                let facebookProfilePicUrl = "https://graph.facebook.com/"+dictionaryResponse!["id"]!+"/picture?type=large"
                
                let profilePicRef = self.storageReference.child("images").child(userUid).child("profilePicture.jpg")
                
                if let fbPicUrl = URL(string: facebookProfilePicUrl) {
                    guard let data = try? Data(contentsOf: fbPicUrl) else {
                        print("There was an error!")
                        return
                    }
                    
                    let metadata = StorageMetadata()
                    metadata.contentType = "image/jpeg"
                    
                    _ = profilePicRef.putData(data, metadata: metadata) { (metadata, error) in
                    }
                }
            case .failed(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
