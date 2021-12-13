//
//  SignInVC.swift
//  Feather
//
//  Created by موضي الحربي on 08/05/1443 AH.
//

import UIKit
import FirebaseAuth

class SignInVC: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    func SignIn(email: String,password:String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            if authResult?.user.email != nil {
                
            }
            print("email:\(String(describing: authResult?.user.email))")
            print("uid:\(String(describing: authResult?.user.uid))")
            self?.performSegue(withIdentifier: "Home", sender: nil)
        }
    }
    
    
    
    
    
    
    @IBAction func signIn(_ sender: Any) {
        SignIn(email:  email.text ?? "", password: password.text ?? "")
    }
    
    @IBAction func signUp(_ sender: Any) {
    }
    
}
