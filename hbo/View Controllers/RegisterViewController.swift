//
//  RegisterViewController.swift
//  hbo
//
//  Created by nisal jayathilaka on 1/26/20.
//  Copyright © 2020 nisal jayathilaka. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterViewController: UIViewController {
    
    
   
    @IBOutlet weak var firstNameTetxField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextFiled: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
    @IBOutlet weak var confirmPasswordtextField: UITextField!
    @IBOutlet weak var zipCodeTetxField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
//    @IBOutlet weak var errorLable: UILabel!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var profileimage: UIImageView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    
    
    func setUpElements(){
        errorLabel.alpha=0
        Utilities.reFirtName(firstNameTetxField)
        Utilities.reLastName(lastNameTextField)
        Utilities.reEmail(emailAddressTextFiled)
        Utilities.rePassword(passwordTextFeild)
        Utilities.reConfirmPassword(confirmPasswordtextField)
        Utilities.reButton(registerButton)
            }
    
    
    func validateFields() -> String? {
        
        if firstNameTetxField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailAddressTextFiled.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextFeild.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            zipCodeTetxField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "please fill in all fields."
        }
        
        let cleanedPassword = passwordTextFeild.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false
        {
            return "  password least 8 carackters, special character and a number"
        }
        
        return nil
    }
   
    
    @IBAction func registerTapped(_ sender: Any) {
      
        
        let error = validateFields()
        if error != nil
        {
            showError(error!)
        }
        else
        {
            
            let firstName = firstNameTetxField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailAddressTextFiled.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextFeild.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let zipcode = zipCodeTetxField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                if err != nil
                {
                    self.showError("error cretaing user")
                }
                else{
                   let db = Firestore.firestore()
                    db.collection("user").addDocument(data:
                    ["fistname" : firstName, "lastname" : lastName, "email" : email, " zipcode" : zipcode,"uid" : result!.user.uid]) { (error) in
                        
                        if error != nil {
                        self.showError("error saving user data")
                        }
                    }
                    self.trnasitionToHome()
                }
                
            }
        }
        }
    
    
    
   
    func showError(_ message:String) {
        self.errorLabel.alpha = 1
        self.errorLabel.text = message
    }
    
    func trnasitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constans.Storyboard.homeviewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
}
