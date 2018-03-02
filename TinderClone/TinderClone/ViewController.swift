//
//  ViewController.swift
//  TinderClone
//
//  Created by George Dimitrov on 2018-02-10.
//  Copyright © 2018 George Dimitrov. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController, LoginButtonDelegate {
    var databaseReference: DatabaseReference!
    
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        switch result {
        case .success(let grantedPermissions, let declinedPermissions, let token):
                performSegue(withIdentifier: "showSigninScreen", sender: self)
                addUserToFirebase()
        case .failed(let error):
                print (error)
        case .cancelled:
            print ("Cancelled")
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        
    }
    
    func addUserToFirebase() {
        let accessToken = AccessToken.current
        guard let accessTokenString = accessToken?.authenticationToken else {
            return
        }
        
        let credentials = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        
        Auth.auth().signIn(with: credentials) { (user, error) in
            if let error = error {
                print(error)
                return
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        databaseReference = Database.database().reference()
        if let accessToken = AccessToken.current {
            if let user = Auth.auth().currentUser {
                databaseReference.child("users").child(user.uid).observeSingleEvent(of: .value, with: { (snapshot) in
                    // Get user value
                    let value = snapshot.value as? NSDictionary
                    let interestedInWomen = value?["interestedInWomen"] as? Bool ?? false
                    if interestedInWomen {
                        self.performSegue(withIdentifier: "logUserIn", sender: self)
                    } else {
                        self.performSegue(withIdentifier: "showSigninScreen", sender: self)
                    }
                }) { (error) in
                    print(error.localizedDescription)
                    //performSegue(withIdentifier: "showSigninScreen", sender: self)
                }
            }
        } else {
            let loginButton = LoginButton(readPermissions: [ .publicProfile, .email ])
            loginButton.center = view.center
            loginButton.delegate = self
            view.addSubview(loginButton)
        }
    }
    
}

