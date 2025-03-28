//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import CLTypingLabel

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
         super.viewDidLoad()
         // Initially hide the error message label
        errorMessage.isHidden = true
        errorMessage.numberOfLines = 0
        
        emailTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
     }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    DispatchQueue.main.async {
                        self.errorMessage.text = e.localizedDescription
                        self.errorMessage.isHidden = false
                    }
                }else{
                    DispatchQueue.main.async {
                        self.errorMessage.isHidden = true
                        self.performSegue(withIdentifier: Constants.registerSegue, sender: self)
                    }
                }
            }
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        // Hide the error message label when the text field is edited
        errorMessage.isHidden = true
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "GoToErrorPage"){
//            let destinatioVC = segue.destination as! ErrorViewController
//            destinatioVC.error = errors
//        }
//    }
}
