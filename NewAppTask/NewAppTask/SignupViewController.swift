//
//  SignupViewController.swift
//  NewAppTask
//
//  Created by Mac on 21/09/23.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var txtusename: UITextField!
  
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var ConPass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnClickedup(_ sender: UIButton) {
        if let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginTableViewController") as? LoginTableViewController{
            self.navigationController?.popViewController(animated: true)
        }
        if let email = txtEmail.text, let password = txtPassword.text, let username =
            txtusename.text, let ConPassword = ConPass.text{
            if username == ""{
                print("Please enter username")
            }else if !email.validateEmailId(){
                openAlert(title: "Alert", message: "please enter valid email", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{_ in }])
                print("email is not valid")
            } else if !password.validatePassword(){
                print("Password is not valid")
           }
           else {
            if ConPassword == ""{
                print("Please confirm password")
            } else{
                if password == ConPassword{
                    
                    // navigation code
                   
                    // Login Screen Navigate
                    print("Login Screen Navigate ")
                } else{
                    print("Password does not match")
                }
            }
           }
           }else{
            print("Please check your details")
           }
    }


    @IBAction func btnSignupclicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
   
}
