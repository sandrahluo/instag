//
//  LoginViewController.swift
//  InstaG
//
//  Created by Sandra Luo on 2/26/18.
//  Copyright © 2018 Sandra Luo. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignin(_ sender: Any) {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                let alertController = UIAlertController(title:"Error Encountered", message: error.localizedDescription, preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) {(action) in}
                alertController.addAction(OKAction)
                self.present(alertController, animated: true)
            }
            else {
                print("Logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    @IBAction func onSignup(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                let alertController = UIAlertController(title: "Error Encountered", message: error.localizedDescription, preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) {(action) in }
                alertController.addAction(OKAction)
                self.present(alertController,animated: true)
            }
            else {
                print("added new user successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    

}
