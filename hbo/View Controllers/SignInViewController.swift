//
//  SignInViewController.swift
//  hbo
//
//  Created by nisal jayathilaka on 1/26/20.
//  Copyright © 2020 nisal jayathilaka. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

  
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
//    @IBOutlet weak var errorLable: UILabel!
    @IBOutlet weak var errorLable: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupelments()
        // Do any additional setup after loading the view.
    }
    func setupelments() {
        errorLable.alpha=0
        Utilities.styleFirstName(emailAddressTextField)
        Utilities.styleLastName(passwordTextField)
        Utilities.styleSignInbutton(signInButton)
    }
    

    @IBAction func singInTapped(_ sender: Any) {
        
        
       // let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let email = emailAddressTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in

            if error != nil {
                self.errorLable.alpha = 1
                self.errorLable.text = error!.localizedDescription
            }
            else
            {
                
                let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
                
                let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
                loadingIndicator.hidesWhenStopped = true
                loadingIndicator.style = UIActivityIndicatorView.Style.gray
                loadingIndicator.startAnimating();
                
                alert.view.addSubview(loadingIndicator)
                self.present(alert, animated: true, completion: nil)
                
                
                let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constans.Storyboard.homeviewController) as? HomeViewController

                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
                
                alert.dismiss(animated: false, completion: nil)
            }
        }
        

    
    
//        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
//            // ...
//            if(error == nil)
//            {
//                var user_email:String?
//                var UID: String?
//                if let user = user {
//                    _ = user.user.displayName
//                    user_email = user.user.email
//                    UID = user.user.uid
//                    print("eeeeeeeeeee\(user_email!)")
//                }
//
//                //self.showAlert(message: "SignIn Successfully! Email: \(user_email!)")
//                UserDefaults.standard.set(user_email, forKey: "LoggedUser")
//                UserDefaults.standard.set(UID, forKey: "UserUID")
//                UserDefaults.standard.set(true, forKey: "LoggedIn")
//                UserDefaults.standard.synchronize()
//                alert.dismiss(animated: false, completion: nil)
//                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController")
//                self.present(vc, animated: true, completion: nil)
//
//
//                //                let trial = HomeViewController ()
//                //                self.navigationController?.pushViewController (trial, animated: true)
//
//            }
//            else{
//                if let errorCode = AuthErrorCode(rawValue: error!._code) {
//                    switch errorCode {
//                    case.wrongPassword:
//                        alert.dismiss(animated: false, completion: nil)
//                        self.showAlert(message: "You entered an invalid password please try again!")
//                        break
//                    case.userNotFound:
//                        alert.dismiss(animated: false, completion: nil)
//                        self.showAlert(message: "There is no matching account with that email")
//                        break
//                    default:
//                        alert.dismiss(animated: false, completion: nil)
//                        self.showAlert(message: "Unexpected error \(errorCode.rawValue) please try again!")
//                        print("Creating user error \(error.debugDescription)!")
//                    }
//                }
//            }
//        }
//
//
//
//
//}
//    func showAlert(message:String)
//    {
//
//        let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        self.present(alert, animated: true)
//    }
}
    
    
}
