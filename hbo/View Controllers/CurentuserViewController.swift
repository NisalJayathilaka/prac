//
//  CurentuserViewController.swift
//  hbo
//
//  Created by nisal jayathilaka on 2/14/20.
//  Copyright © 2020 nisal jayathilaka. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import SwiftyJSON
import FirebaseFirestore

class CurentuserViewController: UIViewController {
    
    static var testVari:String?
    
    @IBOutlet weak var frstname: UILabel!
    
    @IBOutlet weak var lastname: UILabel!
    
    @IBOutlet weak var emailtxt: UILabel!
//    var uid: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let userID = Auth.auth().currentUser?.uid ?? ""
//          print("655656565565665")
//        print(userID)
        
        let userID  = Auth.auth().currentUser?.uid ?? ""
        print("Current user ID is" + userID)
        
        getData(_textField: emailtxt, _fieldValue: "email")
         getData(_textField: frstname, _fieldValue: "fistname")
        
        
        //adding snapshot listener to 1 child
//        Firestore.firestore().collection("user").document("70yFmuW4ewRy4sBPRisV")
//            .addSnapshotListener { documentSnapshot, error in
//                guard let document = documentSnapshot else {
//                    print("Error fetching document: \(error!)")
//                    return
//                }
//                guard let data = document.data() else {
//                    print("Document data was empty.")
//                    return
//                }
////
//
//
//        }
        //get single chile data without observing to that okkkk kollo

//         Firestore.firestore().collection("user").document("70yFmuW4ewRy4sBPRisV").getDocument { (snapshot, error) in
//            if let _error = error {
//                print(_error.localizedDescription)
//                return
//            }
//
//          let _snapshot = snapshot
//
//
//            let dict = _snapshot!.data()
//            print(dict)
//            print(dict!["email"] as! String)
//
//            self.emailtxt.text = (dict!["email"] as! String)
//
//        }

//        let ref = Database.database().reference().child("user").child("1malalMo7dFrSYw2EjlK")
//        ref.observe(.value, with: { snapshot in
//            print(snapshot.value as Any)
//
//            let dict = snapshot.value as? [String: AnyObject]
////            let json = JSON(dict as Any)
////
////
////            print(json)
////           self.frstname.text = "\(json["frstname"].stringValue) \(json["lastname"].stringValue)"
////
////            self.emailtxt.text = json["email"].stringValue
//
//
//
//        })
//        let user = Auth.auth().currentUser
//        if let user = user {
//            // The user's ID, unique to the Firebase project.
//            // Do NOT use this value to authenticate with your backend server,
//            // if you have one. Use getTokenWithCompletion:completion: instead.
//            let uid = user.uid
//            let email = user.email
//            //let photoURL = user.photoURL
//            // ...
//        }
        
        

    
    
    }
    func getData(_textField:UILabel,_fieldValue:String)  {
        
//        let userID = Auth.auth().currentUser?.uid ?? ""
//        print(userID)
        
        Firestore.firestore().collection("user").document("70yFmuW4ewRy4sBPRisV").getDocument { (snapshot, error) in
            if let _error = error {
                print(_error.localizedDescription)
                return
            }
            
            let _snapshot = snapshot
            
            
            let dict = _snapshot!.data()
//            print(dict)
//            print(dict!["email"] as! String)
            
//             print("1111111111")
            
           
            CurentuserViewController.testVari = (dict![_fieldValue] as! String)
//
            self.setData(label: _textField, value: CurentuserViewController.testVari!)
            
//            _textField.text = (dict![_fieldValue] as! String)
            
        }
//
    }
    func setData(label:UILabel,value:String) {
        label.text = value
    }

}

// get user detils from the database 
