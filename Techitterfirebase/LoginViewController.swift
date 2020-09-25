//
//  LoginViewController.swift
//  Techitterfirebase
//
//  Created by 森田貴帆 on 2020/09/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var loginTextField:  UITextField!
    var saveData: UserDefaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login() {
        if loginTextField.text == "kihomori" {
            saveData.set(loginTextField.text, forKey: "username")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    //func  unwindViewCntroller(segue: UIStoryboardSegue) {
        
    //}

}
