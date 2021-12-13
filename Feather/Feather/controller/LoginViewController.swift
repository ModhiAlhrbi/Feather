//
//  LoginViewController.swift
//  Feather
//
//  Created by موضي الحربي on 08/05/1443 AH.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailLogin: UITextField!
    
    
    @IBOutlet weak var passowrdLogin: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
   
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        
    }
    
    
    
    
    
    
/*
    func Login(email:String,password:String){
       
        Auth.auth().signIn(withEmail: email, password:password){
            
            [weak self] authResult, error in
            
            if let error = error {
                print(error.localizedDescription)
                
            }
            if authResult?.user.email != nil {
        
            }
            print("email:\(String(describing: authResult?.user.emai))")
            print("uid:\(String(describing: authResult?.user.emai))")
            self?.performSegue(withIdentifier: "home", sender: nil)
        
        }
    }
*/
 
 }
