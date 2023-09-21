//
//  LiginTableViewController.swift
//  NewAppTask
//
//  Created by Mac on 21/09/23.
//

import UIKit

class LoginTableViewController: UITableViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dissmisskeyboard()
    }
    
    
    @IBAction func HomeScreen(_ sender: Any) {
        if let HomeVC = self.storyboard?.instantiateViewController(identifier: "ViewController") as?  ViewController{
            self.navigationController?.pushViewController(HomeVC, animated: true)
        }
       
    }
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        Validationcode()
    }
    
   
    @IBAction func btnSignupclicked(_ sender: UIButton) {
        if let singupVC = self.storyboard?.instantiateViewController(identifier: "SignuppViewController") as? SignupViewController{
            self.navigationController?.pushViewController(singupVC, animated: true)
        }
    }
    }
  
        
    

    extension LoginTableViewController{
    override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    let tableViewHight = self.tableView.frame.height
    let contentHeight = self.tableView.contentSize.height
    
    let centeringInset = (tableViewHight - contentHeight) / 2.0
    let topInset = max(centeringInset, 0.0)
    
    self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
    
}
    }
    extension LoginTableViewController{
fileprivate func Validationcode(){
if let email =  txtEmail.text, let password = txtPassword.text{
    if !email.validateEmailId(){

        openAlert(title: "Alert", message: "Email address not found", alertStyle: .alert,actionTitles:["okay"],actionStyles:[.default],actions: [{ _ in
            print("okay clicked")
        }])
    
} else if  !password.validatePassword(){
    openAlert(title: "Alert", message: "Please Enter Valid Password", alertStyle: .alert,actionTitles:["okay"],actionStyles:[.default],actions: [{ _ in
        print("okay clicked")
    }])
    
} else{
    //Navigation -  Home Screen
    if let HVC = self.storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController{
        self.navigationController?.pushViewController(HVC, animated: true)
    }
}
}else{
    openAlert(title: "Alert", message: "Please add details", alertStyle: .alert,actionTitles:["okay"],actionStyles:[.default],actions: [{ _ in
         print("okay clicked")
    }])
}
}
}

/*  @IBOutlet weak var txtEmail: UITextField!
 @IBOutlet weak var txtPassword: UITextField!
 
 override func viewDidLoad() {
     super.viewDidLoad()
     self.dissmisskeyboard()
  }
 
 @IBAction func HomeScreen(_ sender: Any) {
     if let HomeVC = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController{
         self.navigationController?.pushViewController(HomeVC, animated: true)
     }
 }
 
 @IBAction func btnLoginClicked(_ sender: UIButton) {
     Validationcode()
}
 @IBAction func btnSignupClicked(_ sender: UIButton) {
     if let signupVC = self.storyboard?.instantiateViewController(identifier: "SignupViewController") as? SignupViewController{
         self.navigationController?.pushViewController(signupVC, animated: true)
     }
 }
}
 extension LoginTableViewController {
//  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
  //   return UIScreen.main.bounds.height
 //}
 
 override func viewDidLayoutSubviews() {
     super.viewDidLayoutSubviews()
     let tableViewHight = self.tableView.frame.height
     let contentHeight = self.tableView.contentSize.height
     
     let centeringInset = (tableViewHight - contentHeight) / 2.0
     let topInset = max(centeringInset, 0.0)
     
     self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
     
 }

 

}
 extension LoginTableViewController{
fileprivate func Validationcode(){
if let email =  txtEmail.text, let password = txtPassword.text{
 if !email.validateEmailId(){

     openAlert(title: "Alert", message: "Email address not found", alertStyle: .alert,actionTitles:["okay"],actionStyles:[.default],actions: [{ _ in
         print("okay clicked")
     }])
 
} else if  !password.validatePassword(){
 openAlert(title: "Alert", message: "Please Enter Valid Password", alertStyle: .alert,actionTitles:["okay"],actionStyles:[.default],actions: [{ _ in
     print("okay clicked")
 }])
 
} else{
 //Navigation -  Home Screen
 if let HVC = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController{
     self.navigationController?.pushViewController(HVC, animated: true)
 }
}
}else{
 openAlert(title: "Alert", message: "Please add details", alertStyle: .alert,actionTitles:["okay"],actionStyles:[.default],actions: [{ _ in
      print("okay clicked")
 }])
}
}
}

*/
