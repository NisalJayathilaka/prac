//
//  HomeViewController.swift
//  hbo
//
//  Created by nisal jayathilaka on 1/26/20.
//  Copyright © 2020 nisal jayathilaka. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    @IBOutlet weak var fogtbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        configurecomponents()
        
       
    }
    
   
    @IBAction func tapedfogtbtn(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let sb = self.storyboard?.instantiateViewController(withIdentifier: "loginVC") as! SignInViewController
            self.present(sb, animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        
//        try Auth.auth().signOut()
//        if let storyboard = self.storyboard {
//            let vc = storyboard.instantiateViewController(withIdentifier: "loginVC") as! SignInViewController
//            self.present(vc, animated: false, completion: nil)
//        }
        
    }
    
}



