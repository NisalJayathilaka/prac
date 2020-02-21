//
//  UserViewController.swift
//  hbo
//
//  Created by nisal jayathilaka on 2/16/20.
//  Copyright © 2020 nisal jayathilaka. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import SwiftyJSON
import FirebaseFirestore


class UserViewController: UIViewController {

    @IBOutlet weak var fnametxt: UITextField!
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        ref = Database.database().reference()
        
        let userID = Auth.auth().currentUser?.uid
        ref.child("user").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let values = snapshot.value as? NSDictionary
            self.fnametxt.text = values?["frstname"] as? String
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    

   

}
