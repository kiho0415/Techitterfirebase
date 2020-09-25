//
//  PostViewController.swift
//  Techitterfirebase
//
//  Created by 森田貴帆 on 2020/09/22.
//

import UIKit
import Firebase
import FirebaseDatabase 

class PostViewController: UIViewController {
    
    @IBOutlet var posttextfield: UITextField!
    
    var saveData: UserDefaults = UserDefaults.standard
    var ref : DatabaseReference! //データの書き込みを行うために必要
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    @IBAction func post() {
        
        if  posttextfield.text != nil{
            let post:  [String : Any]  = ["username": saveData.string(forKey: "username"), "date": ServerValue.timestamp(), "contents": posttextfield.text!]  //←この方がスッキリする
            ref.child("post").childByAutoId().setValue(post)
        }
        
    }
    
}
