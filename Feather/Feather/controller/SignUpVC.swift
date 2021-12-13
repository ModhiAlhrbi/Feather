//
//  SignUpVC.swift
//  Feather
//
//  Created by موضي الحربي on 08/05/1443 AH.
//

import UIKit
import FirebaseAuth
class SignUpVC: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    
    
    @IBOutlet weak var userName: UITextField!
    
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func SignUp(email: String,password:String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in

           print("email:\(String(describing: authResult?.user.email))")
           print("uid:\(String(describing: authResult?.user.uid))")

           UserApi.addUser(name: "Modhi", uid: authResult?.user.uid ?? "", phone: "96656659208", email: email) { check in                if check {
               print("Done saving in Database")
               } else {
               }
           }
        }
    }

   
    @IBAction func signUp(_ sender: Any) {
        
        SignUp(email:email.text ?? "" , password: password.text ?? "" )
        
    }
    
}
