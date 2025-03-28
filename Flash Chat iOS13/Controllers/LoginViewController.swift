//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import CLTypingLabel

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var noAccountError: UILabel!
    
    override func viewDidLoad() {
        // Initially hide the error message label
        noAccountError.isHidden = true
        noAccountError.numberOfLines = 0 // Allow the label to use multiple lines
        
        emailTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    if let e = error{
                        self.noAccountError.text = e.localizedDescription
                        self.noAccountError.isHidden = false
                    }else{
                        
                        self.noAccountError.isHidden = true
                        
                        //Naviage to the chat
                        self.performSegue(withIdentifier: Constants.loginSegue, sender: self)
                    }
            }
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        // Hide the error message label when the text field is edited
        noAccountError.isHidden = true
    }
}

