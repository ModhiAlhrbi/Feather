//
//  ViewController.swift
//  ChatTAK
//
//  Created by Mobark Alseif on 03/05/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
            print(user.name)
        }
        // Do any additional setup after loading the view.
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
            // ...
        }
    }
    

    
    @IBAction func signButton(_ sender: UIButton) {
        
       // SignUp(email: email.text ?? "", password: password.text ?? "")
        
    }
    @IBAction func singIn(_ sender: UIButton) {
        
        SignIn(email: email.text ?? "", password: password.text ?? "")
        
    }
    
}


