//
//  ViewController.swift
//  hbo
//
//  Created by nisal jayathilaka on 1/26/20.
//  Copyright © 2020 nisal jayathilaka. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    
    @IBOutlet weak var btnreg: UIButton!
    
    @IBOutlet weak var btnlog: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        self.configurecomponents()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func configurecomponents() {
        if Auth.auth().currentUser != nil {
            DispatchQueue.main.async {
                let naController = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
                self.present(naController, animated: true, completion: nil)
                
                //                let naController = UINavigationController(rootViewController: SignInViewController())
                //                naController.navigationBar.barStyle = .black
                //                self.present(naController, animated: true, completion: nil)
            }
        }
    }


}

