//
//  LoginVC.swift
//  FirstApp
//
//  Created by Shridevi Sawant on 30/09/24.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var unameTF: UITextField!
    
    @IBOutlet weak var pwdTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginVC: viewDidLoad")
        // Do any additional setup after loading the view.
        
    
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // dimiss the keyboard
        view.endEditing(true)
    }
    

    
    @IBAction func loginClicked(_ sender: Any) {
        
        let username = unameTF.text ?? ""
        let pwd = pwdTF.text ?? ""
        
        print("Username: \(username)")
        print("Password: \(pwd)")
        
        if username.isEmpty || pwd.isEmpty {
            // no navigation
            print("Enter valid credentials")
        }else {
            // navigate to next screen
            let vc = storyboard!.instantiateViewController(withIdentifier: "thankyouvc") as! ThankYouVC
            
            vc.userid = username
            
            show(vc, sender: self) // pushes VC into stack (navigation controller)
           // present(vc, animated: true) // modal presentation
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        print("LoginVC: viewDidAppear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("LoginVC: viewWillAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("LoginVC: viewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("LoginVC: viewWillDisappear")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
