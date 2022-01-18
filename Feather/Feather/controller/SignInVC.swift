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
    
    
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser?.uid != nil {
        // performSegue(withIdentifier: "Home", sender: nil)
        }
        
    }
    func SignIn(email: String,password:String) {
        
        print(email);
        print(password);
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            if authResult?.user.email != nil {
                print("email:\(String(describing: authResult?.user.email))")
                print("uid:\(String(describing: authResult?.user.uid))")
                self?.performSegue(withIdentifier: "Home", sender: nil)
            }

        }
    }
    
    
    
    @IBAction func signIn(_ sender: Any) {
        
        
        let inputPassword = password.text ?? ""
        
        if email.text != nil && inputPassword != "" {
            SignIn(email:  email.text ?? "", password: password.text ?? "")
        } else {
            
            let alertLogin = UIAlertController(title: "Error".localized, message: "Please put your Email and Passward".localized, preferredStyle: .alert)
            alertLogin.addAction(UIAlertAction(title: "ok".localized, style: .cancel))
            
            present(alertLogin, animated: true)
            
        }
        
    }
    @IBAction func signUp(_ sender: Any) {
    }
    
}
