//
//  AddmoviesViewController.swift
//  hbo
//
//  Created by nisal jayathilaka on 2/19/20.
//  Copyright © 2020 nisal jayathilaka. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import LocalAuthentication

class AddmoviesViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

//    @IBOutlet weak var txtMovieName: UITextField!
//    @IBOutlet weak var txtDirector: UITextField!
//    @IBOutlet weak var txtRating: UITextField!
    
    @IBOutlet weak var proimageview: UIImageView!
    @IBOutlet weak var uploadpost: UIButton!
    @IBOutlet weak var addpicbtn: UIButton!
    
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
        
        
    
    

    @IBAction func selectimage(_ sender: Any) {
        
    }
    
    @IBAction func addmovies(_ sender: Any) {
        
        
        
    
}
}
